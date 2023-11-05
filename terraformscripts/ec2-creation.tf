provider "aws"{
region = "us-east-1"

}
resource  "aws_instance" "ec2instance"{
ami = "ami-05c13eab67c5d8861"
key_name="EC2-KEY"
security_groups = ["launch-wizard"]
instance_type = "t2.micro"
tags = {
Name = "tomcatserver"
}

}
