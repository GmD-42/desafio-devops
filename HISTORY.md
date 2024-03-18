# Projeto Desafio Globo: Passo a Passo 

Este documento apresenta o cronograma detalhado do desenvolvimento do projeto, destacando as etapas já concluídas e oferecendo comentários sobre as decisões de projeto tomadas ao longo do processo.

## 1º Passo: Teste e Git ✅

- Criar repositório no GitHub. ✅
- Executar `api.py` localmente para compreender o funcionamento da aplicação. ✅

Comentário: A criação de um repositório é uma prática padrão para o controle de versão, e o GitHub é amplamente reconhecido como o local ideal para hospedar projetos desse tipo devido à sua popularidade e recursos robustos de colaboração. Testar a aplicação localmente é um passo fundamental para compreender seu funcionamento antes de realizar qualquer modificação significativa.

## 2º Passo: Docker ✅

- Atualizar a aplicação para ser executada em um contêiner Docker. ✅

Comentário: Utilizar contêineres Docker é uma prática comum para garantir que a aplicação seja executada consistentemente em diferentes ambientes. Isso facilita o gerenciamento de dependências, a implantação da aplicação, o controle de logs e um consumo menor de recursos de hardware, como memoria e armazenamento.

## 3º Passo: Instalar Stack de Monitoramento ✅

- Adicionar Grafana e Prometheus no `docker-compose`. ✅

Comentário: Monitorar o desempenho e a integridade da aplicação é essencial para garantir sua confiabilidade. Grafana e Prometheus são ferramentas populares para monitoramento, oferecendo recursos robustos para visualização e coleta de métricas.

## 4º Passo: Configurar AWS ✅

- Configurar conta na AWS. ✅
- Criar usuário de acesso no IAM e configurar permissões. ✅
- Configurar o [aws-vault](https://github.com/99designs/aws-vault) utilizando as chaves do usuário criado para utilização no Terraform. ✅
- Criar bucket no S3 para guardar o `terraform.state`. ✅
- Criar repositório no ECR. ✅
- Fazer push da imagem da primeira versão da API para o repositório criado no ECR. ✅

Comentário: Para este projeto, optamos por utilizar a AWS para hospedar a aplicação devido à sua longa história como o provedor líder e mais estabelecido do mercado, oferecendo uma base sólida de confiabilidade. Além disso, a AWS Free Tier proporciona a oportunidade de criar laboratórios como este de forma mais acessível. Desde o primeiro acesso, adotamos medidas de segurança como a configuração de MFA para o usuário root no IAM, seguido pela criação de um usuário de acesso com permissões de administrador da conta através de IAM roles. Um bucket no S3 foi configurado para armazenar o estado do Terraform, prevenindo conflitos de bloqueio de estado no projeto. Adicionalmente, estabelecemos um repositório no ECR para armazenar a imagem da API, simplificando o uso de CI/CD e para fazer push da primeira imagem para o repositório foi utilizado aws-cli. A utilização do AWS Vault garante um método seguro para armazenar e acessar credenciais da AWS, permitindo evitar a inclusão de informações de acesso sensíveis, como AWS_ACCESS_KEY_ID e AWS_SECRET_ACCESS_KEY, no código-fonte. Essas práticas reforçam a segurança e a confiabilidade do projeto como um todo.

## 5º Passo: Infraestrutura como Código (IaC) ✅

- Iniciar projeto Terraform. ✅
- Executar o `terraform apply` do projeto e realizar testes de funcionalidade. ✅

Comentário: Adotar a infraestrutura como código simplifica a implantação e a manutenção do ambiente de produção. O Terraform é uma ferramenta popular para gerenciar a infraestrutura de forma automatizada e previsível.

## 6º Passo: Configurar Dashboards ☑️

- Configurar dashboards de monitoramento no Grafana.

Comentário: 

## 7º Passo: Esteira de Atualização CI/CD ☑️

- Criar pipeline que atualiza a imagem no ECR quando o repositório for atualizado.
- Após a conclusão da pipeline, fazer um release para atualizar a aplicação. 

Comentário: 
