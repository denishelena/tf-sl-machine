provider "aws" {
  region = "sa-east-1"

}

module "ec2" {
    source = "git::https://github.com/denishelena/tf-module-ec2.git?ref=v1.0.2"
   # source = "./ec2"
    tagname = "teste123"
    subnet_id = "subnet-e0d9bb84"
    sg = [module.sg.sg_id]
    ebs_blocks = [
      {
        device_name = "/dev/sdg"
        volume_size = "10"
        volume_type = "gp2"  
      },
      {
        device_name = "/dev/sdg"
        volume_size = "10"
        volume_type = "gp2"  
      }
    ]
}

module "sg" {
  source = "git::https://github.com/denishelena/tf-module-sg.git?ref=v1.0.2"
 # source = "./sg"
  vpc_id = "vpc-7fc90d1b"
  ingress = [
    {
      from_port = "80"
      to_port   = "80"
    #  cidr = ["0.0.0.0/0"]
    },
    {
      from_port = "443"
      to_port   = "443"
    #  cidr = ["0.0.0.0/0"]
    }
    {
      from_port = "22"
      to_port   = "22"
    #  cidr = ["0.0.0.0/0"]
    }
  ]
}