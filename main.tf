provider  "aws" {
region = "us-east-1"
access_key = "AKIASTZS7WGYWGXWS2WE"
secret_key = "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"
}

resource "aws_instance" "one" {
  ami                       ="ami-006dcf34c09e50022"
  instance_type             = "t2.micro"
  key_name                  = "freshpair"
  vpc_security_group_ids    = [aws_security_group.three.id]
  availability_zone = "us-east-1b"
 user_data       = <<EOF
 #!/bin/bash
 sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo "hai all this is my website created by terraform infrastructurte by mounika varma server-1" > /var/www/html/index.html
EOF
  tags = {
  Name = "server-1"
  }
}
    
resource "aws_instance" "two" {
  ami                       ="ami-006dcf34c09e50022"
  instance_type             = "t2.micro"
  key_name                  = "freshpair"
  vpc_security_group_ids    = [aws_security_group.three.id]
  availability_zone         = "us-east-1c"
  user_data       = <<EOF
  #!/bin/bash
  sudo -i
  yum install httpd -y
  systemctl start httpd
  chkconfig httpd on
  echo "hai all this is my website created by terraform infrastructurte by mounika varma server-2" > /var/www/html/index.html
 EOF
  tags = {
  Name = "server-2"
  }
}

resource "aws_security_group" "three" {
  name        = "elb-sg"
  
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

   ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "elb-sg"
  }
}
