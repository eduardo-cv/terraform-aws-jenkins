# Pré-requisitos - [Terraform - AWS - Jenkins v2]

<h3> Obs: O arquivo <b>"variaveis-config.tf"</b> e o lugar para vc configurar o que deseja para sua infra.<h3>

1. Uma conta ativa da AWS.

2. AWS Command Line Interface (AWS CLI) instalada e configurada com as permissões necessárias. Para obter mais informações sobre isso, consulte <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html" rel="nofollow" _istranslated="1">esta documentação</a>.</li>

3. Terraform instalado e configurado. Para obter mais informações sobre isso, consulte <a href="https://learn.hashicorp.com/tutorials/terraform/install-cli" rel="nofollow" _istranslated="1">esta documentação</a>.

<h3>Colaboradores</h3>

- Eduardo C.
- Gerlucio Moura

<h3>Laboratório - Jenkins | docker</h3>

1 - Criar um bucket na região da virginia Exemplo <b>"terraform-state-seu-projeto"</b> e depois substituir no arquivo <b>"main.tf"</b>

<h3>Espero que tenha ajudado a entender o modelo que serve como base para criar sua infra.</h3>

**NOTA**: Os recursos criados podem gerar em custos em sua conta da AWS. Considere excluir os recursos criados assim que os testes forem concluídos. Para obter mais informações, consulte [Definição de preço da AWS](https://aws.amazon.com/pricing/).

<h3>Verifique se sua conta ainda se encontra no free-tier (Nível gratuito da AWS) </h3>

terraform destroy --auto-approve