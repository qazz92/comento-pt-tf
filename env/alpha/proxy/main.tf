resource "aws_security_group" "proxy" {
  name        = "proxy"
  description = "proxy"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "proxy"
    Terraform = "true"
  }
}

module "proxy_ec2" {
  source = "../../../modules/ec2"
  ec2_ami = data.aws_ami.ubuntu.id
  ec2_key = "open-vpn-comento-pt"
  ec2_name = "proxy"
  ec2_sg_ids = [aws_security_group.proxy.id]
  ec2_subnet = data.terraform_remote_state.vpc.outputs.private_subnets[0]
  ec2_type = "t3.micro"
  tags = {
    Terraform = "true"
  }
}