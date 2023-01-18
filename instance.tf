resource "aws_instance" "server" {
  ami                         = "ami-06878d265978313ca"
  instance_type               = "t2.micro"
  key_name                    = "basic_infra"
  subnet_id                   = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.security_group_ec2.id]
  user_data            = filebase64("userdata.sh")
  
  tags = {
    Name = "server"
  }
}