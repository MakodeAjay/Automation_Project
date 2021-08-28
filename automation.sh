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

time = $(stat -f "%Sm" -t "%d%m%Y-%H%M" /tmp/Ajay-httpd-logs-*)
size = $(wc -c /tmp/Ajay-httpd-logs-* | awk '{print $1}')

if [ ! -f /var/www/html/inventory.html ]
then
       touch /var/www/html/inventory.html || exit
       echo "Log Type   Time Created   Type   Size " | cat >> /var/www/html/inventory.html
else
	echo "httpd-logs  ${time}  tar  ${size} " | cat >> /var/www/html/inventory.html
fi

sudo apt install cron

sudo systemctl enable cron

# removing files
rm -rf /tmp/Ajay*
