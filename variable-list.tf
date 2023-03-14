##########################################################
# Par de chaves existentes na AWS
##########################################################
variable "ec2_key_par" {
  type = map(string)
  default = {
    "us-east-1" = "par_virginia_linux"
    "us-east-2" = "par_ohio_linux"
  }
}
##########################################################