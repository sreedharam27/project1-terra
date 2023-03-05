provider  "aws" {
region = "us-east-1"
access_key = "AKIASTZS7WGYUAILQZIZ"
secret_key = "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"
}
resource "aws_instance" "one" {
  ami               ="ami-006dcf34c09e50022"
  instance_type     = "t2.micro"
  key_name           = "freshpair"
  availability_zone = "us-east-1d"
  tags = {
  Name = "mouni-tf"
  }
}
    
