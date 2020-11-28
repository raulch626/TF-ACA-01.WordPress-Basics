resource "aws_instance" "app" {
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  ami               = "ami-04d29b6f966df1537"

  subnet_id = aws_subnet.sn-web-A.id
  associate_public_ip_address = true
  key_name = "RCH"
  vpc_security_group_ids = [aws_security_group.allow_web.id]


   tags = {
      Name = "A4L-BASTION"
   }
  
}
