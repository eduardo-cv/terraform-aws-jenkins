##########################################################
#                  EC2 instance - [docker]                       
##########################################################
resource "aws_instance" "docker" {
  count                       = local.ec2_docker.count
  ami                         = local.ec2_docker.ami.id
  instance_type               = local.ec2_docker.instance_type
  vpc_security_group_ids      = local.ec2_docker.sg_ids
  subnet_id                   = local.pub_subnet_ids.docker[count.index]
  associate_public_ip_address = local.ec2_docker.associate_public_ip
  key_name                    = local.ec2_docker.key_name
  iam_instance_profile        = local.ec2_docker.iam_instance_profile

  user_data = <<-EOF
    ${file("./files/user-data/user-data-docker.sh")}
  EOF 

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = local.ec2_docker.volume_size
  }

  depends_on = [module.vpc]

  tags = {
    Name = local.ec2_docker.tag_name
    Environment = var.env
    Provisioner = "Terraform"
  }
}
##########################################################