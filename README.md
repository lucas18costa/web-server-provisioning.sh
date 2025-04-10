Provisionamento Automático de Servidor Web
Este repositório contém um script para provisionamento automático de um servidor web Apache utilizando o conceito de Infraestrutura como Código (IaC).
📋 Sobre o Projeto
Este projeto automatiza a implantação de um servidor web Apache em ambientes Linux, eliminando a necessidade de configuração manual e garantindo consistência em diferentes ambientes.
O script realiza as seguintes operações:

Atualização dos pacotes do sistema
Instalação do servidor web Apache
Configuração do firewall para permitir tráfego HTTP/HTTPS
Criação de uma página web demonstrativa
Inicialização e habilitação do serviço

🔧 Pré-requisitos

Sistema operacional Linux (Ubuntu, Debian ou distribuições baseadas)
Privilégios de superusuário (root ou sudo)

🚀 Como utilizar

Clone este repositório:
git clone https://github.com/seu-usuario/nome-do-repositorio.git

Acesse o diretório do projeto:
cd nome-do-repositorio

Dê permissão de execução ao script:
chmod +x web-server-provisioning.sh

Execute o script como superusuário:
sudo ./web-server-provisioning.sh

Após a execução bem-sucedida, acesse o servidor web através do endereço IP da máquina no navegador:
http://seu-endereco-ip


🔍 Detalhes da Implementação
O script automatiza todo o processo de instalação e configuração, incluindo:

Verificação de privilégios: Garante que o script está sendo executado com permissões apropriadas
Instalação de pacotes: Instala o Apache e as dependências necessárias
Configuração de firewall: Configura regras para permitir o tráfego web
Página demonstrativa: Cria uma página HTML informativa que exibe dados do servidor
Configuração de serviço: Inicia e habilita o serviço para inicialização automática

🛠️ Tecnologias Utilizadas

Shell Script (Bash)
Apache HTTP Server
UFW (Uncomplicated Firewall)
HTML/CSS (para a página demonstrativa)

🔒 Segurança
Este script inclui configurações básicas de segurança, como:

Configuração adequada de firewall
Permissões apropriadas para os arquivos web
Utilização de usuário específico para o serviço web (www-data)

Para ambientes de produção, recomenda-se implementar medidas adicionais de segurança.
📝 Licença
Este projeto está sob a licença MIT.
🤝 Contribuições
Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou enviar pull requests com melhorias.

Projeto desenvolvido como parte do desafio de Infraestrutura como Código (IaC).
