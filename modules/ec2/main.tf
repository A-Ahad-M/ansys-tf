resource "aws_instance" "ansys_ec2" {
  ami                    = "ami-0c55b159cbfafe1f0"  # Update with your region's AMI ID
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet_1.id
  security_groups        = [ansys_security_group_id]
  key_name               = "my-key-pair"
  associate_public_ip_address = true

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name = "nginx-server"
  }
}
