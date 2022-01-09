resource "aws_security_group" "base_security_group" {
  name        = "base_security_group"
  description = "Bases security group"
  # Incomming traffic to common ports
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["105.160.63.105/32"]
    description = "Allow only SSH traffic"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow only http traffic"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["172.16.0.0/16"]
    description = "Allow ICMP protocol between nodes"
  }
  # Outgoing traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow All traffic to any external port or host"
  }
  # Resource tags
  tags = {
    Name = "Default Security Group"
  }
}