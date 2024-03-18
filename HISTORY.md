# Projeto Desafio Globo: Passo a Passo

Este documento detalha o cronograma do desenvolvimento do projeto, listando as etapas concluídas e as próximas a serem executadas.

## 1º Passo: Teste e Git ✅

- Criar repositório no GitHub. ✅
- Executar `api.py` localmente para compreender o funcionamento da aplicação. ✅

## 2º Passo: Docker ✅

- Atualizar a aplicação para ser executada em um contêiner Docker. ✅

## 3º Passo: Instalar Stack de Monitoramento ✅

- Adicionar Grafana e Prometheus no `docker-compose`. ✅

## 4º Passo: Configurar AWS ✅

- Configurar conta na AWS. ✅
- Criar usuário de acesso no IAM e configurar permissões. ✅
- Configurar o [aws-vault](https://github.com/99designs/aws-vault) utilizando as chaves do usuário criado para utilização no Terraform. ✅
- Criar bucket no S3 para guardar o `terraform.state`. ✅
- Criar repositório no ECR. ✅
- Fazer push da imagem da primeira versão da API para o repositório criado no ECR. ✅

## 5º Passo: Infraestrutura como Código (IaC) ✅

- Iniciar projeto Terraform. ✅
- Executar o `terraform apply` do projeto e realizar testes de funcionalidade. ✅

## 6º Passo: Configurar Dashboards ☑️

- Configurar dashboards de monitoramento no Grafana.

## 7º Passo: Esteira de Atualização CI/CD ☑️

- Criar pipeline que atualiza a imagem no ECR quando o repositório for atualizado.
- Após a conclusão da pipeline, fazer um release para atualizar a aplicação. 

