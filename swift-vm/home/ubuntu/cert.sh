#!/bin/sh
if [ $# -lt 1 ]
then
	  echo "Usage: $0 domain"
	    exit 1
fi
echo "Domain: $1"


#sudo certbot certonly --webroot
certbot --apache -w /var/www/html/ -d mail.$1 # -d $1
# -d www.$1 -d mail2.$1 #--config-dir ~/cert/ --work-dir ~/cert/ --logs-dir ~/cert/

if [ $? -ne 0 ]
then
	echo "Error creating cert. Try again."
	exit 1
fi

echo "Cert success."
