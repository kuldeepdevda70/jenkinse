module "ec2_server" {
  source        = "../../modules/EC2"
  
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  instance_name = "react-server"
  sg_name       = "react-sg"
}


