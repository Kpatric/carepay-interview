

resource "aws_instance" "example" {
    ami = lookup(var.AMIS, var.AWS_REGION, "")
    instance_type = "t2.micro"
    user_data = data.template_file.nginx_template_data.rendered
    vpc_security_group_ids = [
      aws_security_group.base_security_group.id
  ]
   associate_public_ip_address = true
  
}