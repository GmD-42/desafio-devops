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

Comentário: Para este projeto, optei por utilizar a AWS para hospedar a aplicação devido à sua longa história como o provedor líder e mais estabelecido do mercado, oferecendo uma base sólida de confiabilidade. Além disso, a AWS Free Tier proporciona a oportunidade de criar laboratórios como este de forma mais acessível. Desde o primeiro acesso, adotei medidas de segurança como a configuração de MFA para o usuário root no IAM, seguido pela criação de um usuário de acesso com permissões de administrador da conta através de IAM roles. Um bucket no S3 foi configurado para armazenar o estado do Terraform, prevenindo conflitos de bloqueio de estado no projeto. Adicionalmente, foi criado um repositório no ECR para armazenar a imagem da API, simplificando o uso de CI/CD e para fazer push da primeira imagem para o repositório foi utilizado aws-cli. A utilização do AWS Vault garante um método seguro para armazenar e acessar credenciais da AWS, permitindo evitar a inclusão de informações de acesso sensíveis, como AWS_ACCESS_KEY_ID e AWS_SECRET_ACCESS_KEY, no código-fonte. Essas práticas reforçam a segurança e a confiabilidade do projeto como um todo.

## 5º Passo: Infraestrutura como Código (IaC) ✅

- Iniciar projeto Terraform. ✅
- Executar o `terraform apply` do projeto e realizar testes de funcionalidade. ✅

Comentário: Adotar a infraestrutura como código simplifica a implantação e a manutenção do ambiente de produção. O Terraform é uma ferramenta popular para gerenciar a infraestrutura de forma automatizada e previsível.

## 6º Passo: Configurar Dashboards ✅

- Configurar dashboards de monitoramento no Grafana. ✅

Comentário: A configuração de dashboards no Grafana é essencial para monitorar de forma visual o desempenho e a saúde da aplicação, tornando mais fácil identificar problemas e tendências ao longo do tempo. Para atender a essa necessidade, foram criados dashboards específicos, incluindo monitoramento da quantidade e tipos de requisições, bem como o tempo de resposta para cada uma delas. Além disso, foram desenvolvidas visualizações para acompanhar o uso de CPU, memória e sistema de arquivos, proporcionando uma visão abrangente do ambiente de execução da aplicação. 

## 7º Passo: Esteira de Atualização CI/CD ✅

- Criar pipeline que atualiza a imagem no ECR quando o repositório for atualizado. ✅
- Após a conclusão da pipeline, fazer um release para atualizar a aplicação. ✅

Comentário: Implementar uma esteira de CI/CD automatiza o processo de entrega de software, possibilitando atualizações frequentes e confiáveis da aplicação. Isso não apenas garante a estabilidade e a qualidade do software, mas também acelera significativamente o ciclo de desenvolvimento. Para esta finalidade, optei por utilizar o GitHub Actions. Inicialmente, foi criado um workflow que é acionado sempre que um commit é realizado na branch principal `(main)` na pasta do aplicativo. Esse workflow é responsável por realizar o build da imagem e o upload para o ECR (Elastic Container Registry). Para isso, foi necessário criar um usuário IAM na AWS e conceder a ele permissões de acesso ao ECR. Além disso, as credenciais (AWS_ACCESS_KEY_ID e AWS_SECRET_ACCESS_KEY) desse usuário foram armazenadas nos secrets do repositório GitHub. O arquivo `build.yml` utiliza essas credenciais para executar o `docker build` da aplicação e o `docker push` para fazer o upload da imagem para o ECR. Em seguida, para atualizar a imagem em execução no EC2, foi criado um novo usuário na máquina chamado `github`, e sua chave SSH_PRIVATE_KEY foi armazenada nos secrets do repositório GitHub. O workflow `deploy.yaml` é acionado sempre que o workflow `build.yml` é concluído, e se conecta via SSH ao EC2 usando o usuário `github`. Então, ele executa o comando `bash /local/deploy.sh`, que faz `docker pull` da nova imagem do ECR e executa um novo `docker compose up` para atualizar a aplicação. Essa abordagem proporciona uma maneira eficiente e segura de automatizar o processo de implantação e garantir a continuidade da entrega de software.
