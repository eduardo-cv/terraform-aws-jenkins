#cloud-config
package_update: true
package_upgrade: true
runcmd:
- sudo yum update -y
- sudo yum install nano -y
- sudo yum install git -y
- sudo yum search docker -y
- sudo yum info docker -y
- sudo yum install docker -y
- sudo usermod -a -G docker ec2-user
- id ec2-user
- newgrp docker
- sudo yum install python3-pip -y
- sudo pip3 install docker-compose # with root access
- sudo systemctl enable docker.service
- sudo systemctl start docker.service
- sudo systemctl status docker.service
- echo "$PATH"
- export PATH=$PATH:/usr/local/bin
- sudo find / -name "docker-compose" -ls
- docker version
- docker-compose version
- sudo systemctl start docker.service 
- sudo systemctl stop docker.service 
- sudo systemctl restart docker.service 
- sudo systemctl status docker.service 
- sudo yum install -y php-cli unzip
- curl -sS https://getcomposer.org/installer -o composer-setup.php
- sudo php /composer-setup.php --install-dir=/usr/local/bin --filename=composer
