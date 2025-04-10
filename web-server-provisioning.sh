#!/bin/bash

# Script de provisionamento de um servidor web Apache
# Autor: [Seu Nome]
# Data: 10 de Abril de 2025

echo "Iniciando o provisionamento do servidor web..."

# Garantir que o script está sendo executado como root
if [ "$(id -u)" -ne 0 ]; then
    echo "Este script deve ser executado como root ou com sudo"
    exit 1
fi

# Atualizar lista de pacotes
echo "Atualizando lista de pacotes..."
apt update -y

# Instalar o servidor Apache
echo "Instalando o Apache..."
apt install apache2 -y

# Verificar se a instalação foi bem-sucedida
if [ $? -eq 0 ]; then
    echo "Apache instalado com sucesso!"
else
    echo "Falha na instalação do Apache."
    exit 1
fi

# Configurar o firewall para permitir tráfego HTTP/HTTPS
echo "Configurando o firewall..."
if command -v ufw &> /dev/null; then
    ufw allow 'Apache'
    ufw allow 80/tcp
    ufw allow 443/tcp
    echo "Firewall configurado com sucesso!"
else
    echo "UFW não está instalado. Instalando UFW..."
    apt install ufw -y
    ufw allow 'Apache'
    ufw allow 80/tcp
    ufw allow 443/tcp
    echo "Firewall instalado e configurado!"
fi

# Criar uma página web de demonstração
echo "Criando página web de demonstração..."
cat > /var/www/html/index.html << EOF
<!DOCTYPE html>
<html>
<head>
    <title>Servidor Web Provisionado com Sucesso!</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            text-align: center;
        }
        h1 {
            color: #0066cc;
        }
        .success-message {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
            border-radius: 5px;
            padding: 20px;
            margin-top: 20px;
        }
        .info {
            margin-top: 40px;
            text-align: left;
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <h1>Servidor Web Apache</h1>
    <div class="success-message">
        <h2>Provisionado com Sucesso!</h2>
        <p>Este servidor foi configurado automaticamente através de um script de IaC (Infraestrutura como Código).</p>
    </div>
    <div class="info">
        <h3>Informações do Servidor:</h3>
        <ul>
            <li><strong>Data de provisionamento:</strong> $(date)</li>
            <li><strong>Hostname:</strong> $(hostname)</li>
            <li><strong>Distribuição:</strong> $(lsb_release -d 2>/dev/null || cat /etc/os-release | grep "PRETTY_NAME" | sed 's/PRETTY_NAME=//g' | tr -d '"')</li>
            <li><strong>Kernel:</strong> $(uname -r)</li>
            <li><strong>Endereço IP:</strong> $(hostname -I | awk '{print $1}')</li>
        </ul>
    </div>
    <footer>
        <p>Script de provisionamento desenvolvido para o projeto de IaC</p>
    </footer>
</body>
</html>
EOF

# Ajustar permissões
echo "Ajustando permissões..."
chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/

# Iniciar e habilitar o serviço do Apache
echo "Iniciando e habilitando o serviço do Apache..."
systemctl start apache2
systemctl enable apache2

# Verificar status do serviço
if systemctl is-active apache2 >/dev/null 2>&1; then
    echo "Servidor Apache está ativo e rodando!"
    echo "Você pode acessar o servidor web pelo endereço: http://$(hostname -I | awk '{print $1}')"
else
    echo "Algo deu errado. O Apache não está rodando."
    exit 1
fi

echo "Provisionamento do servidor web concluído com sucesso!"