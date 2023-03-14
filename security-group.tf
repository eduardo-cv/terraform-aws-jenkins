##########################################################
#  Grupo de Segurança -> 8080
##########################################################
resource "aws_security_group" "sg_port_8080" {
  description = "Acesso a porta 8080"
  vpc_id      = module.vpc.vpc_id
  name        = "sg_port_8080"
  ingress {
    protocol    = "tcp"
    from_port   = 8080
    to_port     = 8080
    cidr_blocks = local.ingress_cidr_blocks_ip.port-8080 ? ["${local.remote_address.ip}/32"] : ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0", ]
  }
  tags = {
    Name = "terraform_port_8080"
    Environment = var.env
    Provisioner = "Terraform"
  }
}
##########################################################
#  Grupo de Segurança -> SSH
##########################################################
resource "aws_security_group" "sg_ssh" {
  description = "Acesso a porta 22"
  vpc_id      = module.vpc.vpc_id
  name        = "sg_ssh"
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["${local.remote_address.ip}/32"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0", ]
  }
  tags = {
    Name = "terraform_sg_ssh"
    Environment = var.env
    Provisioner = "Terraform"   
  }
}
##########################################################