## Neste documento será listado o passa a passo em ordem cronologia de como foi desenvolvido o projeto

## 1º Passo Teste, e git :white_check_mark:
Criar repositório no git hub. &check;

Rodar api.py localmente para entender como funciona a aplicação. &check; 

## 2º Passo Docker :white_check_mark:
Atualizar aplicação para rodar em container docker. &check;

## 3º Passo Instalar stack de Monitoramento :black_square_button:
Adicionar Grafana e Prometheus no docker compose. &check;

## 4º Passo Configurar AWS :white_check_mark:
Configurar conta na aws. &check;

Criar usuário de acesso no IAM, e configurar permissões. &check;

Configurar o [aws-vault](https://github.com/99designs/aws-vault) utilizando as chaves do usuário criado, para utilizar no terraform. &check;

Criar bucket no s3 para guardar o terraform.state. &check; 

Criar repositório no ECR. &check;

Fazer push da imagem da primeira versão da api para o repositório criado no ECR. &check;

## 5º Passo IaC :black_square_button:
Iniciar projeto Terraform. &check;

Fazer o terraform apply do projeto, e fazer testes de funcionalidade &check;

## 6º Passo Configurar Dashboards :black_square_button:
Configurar dashboards de monitoramento no Grafana.

## 7º Passo Esteira de atualização CI/CD  :black_square_button:
Criar pipeline que atualiza imagem no ECR quando repo for atualizado

Ao termino da pipeline fazer uma Release para atualizar a aplicação
