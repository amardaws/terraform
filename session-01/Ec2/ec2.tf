resource "aws_instance" "web" {
  ami           = "ami-03265a0778a880afb" 
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.roboshop-all.id] 

  tags = {
    Name = "HelloTerraform"
  }
}

resource "aws_security_group" "roboshop-all" {
    name        = var.sg-name
    description = var.sg-description

    ingress {
        description      = "Allow All ports"
        from_port        = var.inbound-from-port # 0 means all ports
        to_port          = 0 
        protocol         = "tcp"
        cidr_blocks      = var.cidr_blocks
        
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        Name = "roboshop-all-aws"
    }
}