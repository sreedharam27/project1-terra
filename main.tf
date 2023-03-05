provider  "aws" {
region = "us-east-1"
access_key = "AKIASTZS7WGYUAILQZIZ"
secret_key = "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"
}

resource "aws_instance" "one" {
  ami               ="ami-006dcf34c09e50022"
  instance_type     = "t2.micro"
  key_name          = "freshpair"
  security_group    = sg.aws_security_group_elb-sg.id
  availability_zone = "us-east-1b"
  user_data = <<-EOF
  #!/bin/bash
  sudo -i
  yum install httpd -y
  systemctl start httpd -y
  chkconfig httpd on
  echo "hello everyone this my new instance server-1" > /var/lib/www/index.html
  EOF
  tags = {
  Name = "server-1"
  }
}
    
resource "aws_instance" "two" {
  ami               ="ami-006dcf34c09e50022"
  instance_type     = "t2.micro"
  key_name          = "freshpair"
  security_group    = sg.aws_security_group_elb-sg.id
  availability_zone = "us-east-1c"
  user_data = <<-EOF
  #!/bin/bash
  sudo -i
  yum install httpd -y
  systemctl start httpd -y
  chkconfig httpd on
  echo "hello everyone this my new instance server-2" > /var/lib/www/index.html
  EOF
  tags = {
  Name = "server-2"
  }
}
