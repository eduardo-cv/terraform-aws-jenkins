##########################################################
#                  EC2 instance - [jenkins]                       
##########################################################
resource "aws_instance" "jenkins" {
  count                       = local.ec2_jenkins.count
  ami                         = local.ec2_jenkins.ami.id
  instance_type               = local.ec2_jenkins.instance_type
  vpc_security_group_ids      = local.ec2_jenkins.sg_ids
  subnet_id                   = local.pub_subnet_ids.jenkins[count.index]
  associate_public_ip_address = local.ec2_jenkins.associate_public_ip
  key_name                    = local.ec2_jenkins.key_name
  iam_instance_profile        = local.ec2_jenkins.iam_instance_profile

  user_data = <<-EOF
    ${file("./files-user-data/user-data-jenkins.sh")}
  EOF 

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = local.ec2_jenkins.volume_size
  }

  depends_on = [module.vpc]

  tags = {
    Name = local.ec2_jenkins.tag_name
    Environment = var.env
    Provisioner = "Terraform"
  }
}
##########################################################