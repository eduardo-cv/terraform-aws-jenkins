##########################################################
/*  Obs : 
  Porta 22 por segurança definida somente para seu ip. */
##########################################################
variable "env" {
  type        = string
  default     = "dev"
}
##########################################################
locals {
  region = "us-east-1"
}
##########################################################
#  Configuração VPC
##########################################################
locals {
  vpc_cidr_pref            = "10.1"
  vpc_azs_avaliable_count  = 2
  vpc_private_subnet_count = 2
  vpc_public_subnet_count  = 2
}
##########################################################
#  Configuração Projeto
##########################################################
locals {
  projeto_name   = "docker" 
  docker_number = 1
}
##########################################################
#  Configuração Grupo Segurança - Somente para meu IP
##########################################################
locals {
  ingress_cidr_blocks_ip = {
    #  definir true somente para seu ip.
    port-8080 = true
  }
}
##########################################################
#  Configuração da instancia Docker
##########################################################
locals {
  ec2_docker = {
    # Informar a qtd de intancia desejada
    count               = local.docker_number
    ami                 = data.aws_ami.amazon-linux-2
    associate_public_ip = true
    instance_type       = "t2.micro"
    key_name            = var.ec2_key_par["${local.region}"]
    volume_size         = 8
    iam_instance_profile = null
    sg_ids = [
      # Selecionar os security groups grafana
      aws_security_group.sg_ssh.id,
      aws_security_group.sg_port_8080.id,
    ]
    tag_name = "docker"
  }
}
##########################################################