# Projeto Toshiro Shibakita - Microsserviços com Docker

Este projeto é uma implementação aprimorada do [repositório original](https://github.com/denilsonbonatti/toshiro-shibakita.git), focada em demonstrar as melhores práticas para implementação de microsserviços utilizando Docker e ferramentas modernas de DevOps.

![Arquitetura do Projeto](https://via.placeholder.com/800x400?text=Arquitetura+do+Projeto+Toshiro+Shibakita)

## Visão Geral

O projeto consiste em uma aplicação dividida em microsserviços:

- **Frontend**: Interface web para o usuário
- **Backend**: API REST em Node.js
- **Banco de Dados**: MySQL para persistência de dados
- **Monitoramento**: Prometheus e Grafana para observabilidade

## Melhorias Implementadas

Em comparação com o projeto original, foram implementadas as seguintes melhorias:

1. **Otimização de Contêineres**:
   - Dockerfiles com multi-stage builds
   - Uso de imagens base Alpine para redução do tamanho
   - Configurações de segurança aprimoradas

2. **Configuração Avançada**:
   - Implementação de variáveis de ambiente com arquivo .env
   - Redes isoladas entre serviços
   - Volumes persistentes para dados

3. **Observabilidade**:
   - Stack de monitoramento com Prometheus
   - Dashboards Grafana pré-configurados
   - Healthchecks em todos os serviços

4. **CI/CD**:
   - Pipeline automatizado com GitHub Actions
   - Build e push automático de imagens Docker
   - Deploy automático para AWS ECS

5. **Infraestrutura como Código**:
   - Configuração completa da AWS com Terraform
   - Ambiente de produção pronto para uso

## Requisitos

- Docker e Docker Compose
- Git
- Terraform (para deploy na AWS)
- Conta AWS (para deploy em nuvem)

## Instalação e Uso Local

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/toshiro-shibakita.git
   cd toshiro-shibakita
   ```

2. Configure as variáveis de ambiente:
   ```bash
   cp .env.example .env
   # Edite o arquivo .env com suas configurações
   ```

3. Inicie os contêineres:
   ```bash
   docker-compose up -d
   ```

4. Acesse a aplicação:
   - Frontend: http://localhost:80
   - Backend API: http://localhost:8080
   - Grafana: http://localhost:3000 (admin/admin)
   - Prometheus: http://localhost:9090

## Deploy na AWS

1. Configure as credenciais da AWS:
   ```bash
   export AWS_ACCESS_KEY_ID="sua-access-key"
   export AWS_SECRET_ACCESS_KEY="sua-secret-key"
   ```

2. Inicialize o Terraform:
   ```bash
   cd terraform
   terraform init
   terraform plan
   terraform apply
   ```

3. Após o deploy, o Terraform exibirá as URLs para acesso:
   - Frontend URL
   - Backend API URL
   - Database Endpoint (para uso interno)

## Estrutura do Projeto

```
toshiro-shibakita/
├── .github/
│   └── workflows/           # CI/CD com GitHub Actions
├── backend/                 # Serviço de API
├── frontend/                # Interface Web
├── database/                # Scripts SQL iniciais
├── monitoring/              # Configurações Prometheus/Grafana
│   ├── prometheus/
│   └── grafana