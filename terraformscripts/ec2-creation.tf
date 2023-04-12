provider "aws" {
 region = "us-east-1"   
  
}

resource "aws_instance" "newinstance" {
  ami = "ami-016eb5d644c333ccb"
  instance_type = "t2.micro"
  security_groups = ["launch-wizard-13","launch-wizard-12"]
  key_name = "Ansible-New"
  tags = {
    Name = "tomcatserver"
  }
}

