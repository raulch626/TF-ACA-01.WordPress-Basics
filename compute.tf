resource "aws_instance" "app" {
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  ami               = "ami-04d29b6f966df1537"

  subnet_id = aws_subnet.sn-web-A.id
  associate_public_ip_address = true
  key_name = "RCH"
  vpc_security_group_ids = [aws_security_group.allow_web.id]

}

   user_data = <<-EOF
              #!/bin/bash
              # STEP 1 - Configure Authentication Variables which are used below
               DBName='a4lwordpress'
               DBUser='a4lwordpress'
               DBPassword='REPLACEME'
               DBRootPassword='REPLACEME'

               # STEP 2 - Install system software - including Web and DB
               sudo yum install -y mariadb-server httpd wget
               sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2


               # STEP 3 - Web and DB Servers Online - and set to startup

               sudo systemctl enable httpd
               sudo systemctl enable mariadb
               sudo systemctl start httpd
               sudo systemctl start mariadb


            # STEP 4 - Set Mariadb Root Password
            mysqladmin -u root password $DBRootPassword


            # STEP 5 - Install Wordpress
            sudo wget http://wordpress.org/latest.tar.gz -P /var/www/html
            cd /var/www/html
            sudo tar -zxvf latest.tar.gz
            sudo cp -rvf wordpress/* .
            sudo rm -R wordpress
            sudo rm latest.tar.gz


            # STEP 6 - Configure Wordpress

            sudo cp ./wp-config-sample.php ./wp-config.php
            sudo sed -i "s/'database_name_here'/'$DBName'/g" wp-config.php
            sudo sed -i "s/'username_here'/'$DBUser'/g" wp-config.php
            sudo sed -i "s/'password_here'/'$DBPassword'/g" wp-config.php   
            sudo chown apache:apache * -R


            # STEP 7 Create Wordpress DB

            echo "CREATE DATABASE $DBName;" >> /tmp/db.setup
            echo "CREATE USER '$DBUser'@'localhost' IDENTIFIED BY '$DBPassword';" >> /tmp/db.setup
            echo "GRANT ALL ON $DBName.* TO '$DBUser'@'localhost';" >> /tmp/db.setup
            echo "FLUSH PRIVILEGES;" >> /tmp/db.setup
            mysql -u root --password=$DBRootPassword < /tmp/db.setup
            sudo rm /tmp/db.setup
              EOF
   tags = {
      Name = "A4L-BASTION"
   }
  

