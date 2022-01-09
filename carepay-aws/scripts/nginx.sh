#!/bin/bash
# Install nginx

if [[ -n $(which nginx) ]]; then
    echo '>> Found the Nginx installed: '
    nginx -version
    echo '>> Continuing with existing nginx installation.'
    echo  $html_template>/var/www/html/index.html
    sudo systemctl enable nginx --now

else
    echo ">> Could not find Nginx installed on this machine. Installing..."
    
   sudo yam install nginx
    echo ">> Installed nginx on this server"
    echo  $html_template>/var/www/html/index.html
    sudo systemctl enable nginx --now
fi