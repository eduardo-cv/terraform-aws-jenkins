##########################################################
#  Saida de dados -> Instancias jenkins
##########################################################
output "instancia_jenkins" {
  value = {   
    for i, aws_instance in aws_instance.jenkins : "jenkins-${format("%03d", "${i + 1}")}" => {
      ami_id            = aws_instance.ami
      ami_descricao     = local.ec2_jenkins.ami.description
      availability_zone = aws_instance.availability_zone
      chave             = aws_instance.key_name
      instancia_tipo    = aws_instance.instance_type
      private_ip        = aws_instance.private_ip
      public_ip         = aws_instance.public_ip
      tag               = local.ec2_jenkins.tag_name
    }
  }
}
##########################################################
#  Saida de dados -> Seu IP Address
##########################################################
output "ip_info" {
  value = {
    cidade    = "${local.remote_address.city}",
    estado    = "${local.remote_address.region}",
    ip        = "${"***"}${substr(local.remote_address.ip, 3, length(local.remote_address.ip))}",
    hostname  = "${"***"}${substr(local.remote_address.hostname, 3, length(local.remote_address.hostname))}",
    operadora = "${local.remote_address.org}",
    pais      = "${local.remote_address.country}"
  }
}
##########################################################