#!/bin/sh
if [ $# -lt 1 ]
then
	  echo "Usage: $0 domain"
	    exit 1
fi
echo "Domain: $1"
FILEW=/etc/rspamd/local.d/worker-controller.inc
echo "password = \"$(rspamadm pw --encrypt -p $1)\";" | sudo tee $FILEW

FILE=/var/lib/rspamd/dkim/mail.pub
if [ ! -f "$FILE" ]; then
	    echo "$FILE does not exist."
	rspamadm dkim_keygen -b 2048 -s mail -k /var/lib/rspamd/dkim/mail.key | sudo tee -a  /var/lib/rspamd/dkim/mail.pub
	sudo chown -R _rspamd: /var/lib/rspamd/dkim
	sudo chmod 440 /var/lib/rspamd/dkim/*
fi



echo "Cert success."
