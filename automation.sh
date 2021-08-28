# Update package details and the package list
sudo apt update -y

sudo apt install awscli

#Install the apache2 package

sudo apt-get install apache2 -y
sudo service apache2 restart

# Create Tar file

tar -cvf /tmp/Ajay-httpd-logs-$(date '+%d%m%Y-%H%M%S').tar /var/log/apache2/

aws s3 \
cp /tmp/Ajay-httpd-logs-* \
s3://upgrad-ajaymakode

rm -rf /tmp/Ajay*

# Update package details and the package list
sudo apt update -y

sudo apt install awscli

#Install the apache2 package

sudo apt-get install apache2 -y
sudo service apache2 restart

# Create Tar file

tar -cvf /tmp/Ajay-httpd-logs-$(date '+%d%m%Y-%H%M%S').tar /var/log/apache2/

aws s3 \
cp /tmp/Ajay-httpd-logs-* \
s3://upgrad-ajaymakode

#remove files
rm -rf /tmp/Ajay*
