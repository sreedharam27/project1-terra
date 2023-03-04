provider  "aws" {
region = "us-east-1"
access_key = "AKIASTZS7WGYRCG35O6A"
secret_key = "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"
}
resource "aws_instance" "one" {
  ami               ="ami-006dcf34c09e50022"
  instance_type     = "t2.micro"
  key_name           = "freshpair"
  availability_zone = "us-east-1a"
  tags = {
  Name = "basic project"
  }
}
    
