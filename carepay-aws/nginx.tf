
data "template_file" "nginx_template_data" {
  template = file("scripts/nginx.sh")
  vars = {
    html_template  = file("templates/index.html")
 
  }
}
