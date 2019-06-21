sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install python-certbot-nginx
sudo certbot --nginx

sudo apt-get install postfix postfix-mysql dovecot-core dovecot-imapd dovecot-pop3d dovecot-lmtpd dovecot-mysql mysql-server

sudo mysql_secure_installation

sudo mysqladmin -u root -p create mailserver

sudo mysql -u root -pNarsimha@1998 < sqlscript.sql

sudo cp /etc/postfix/main.cf /etc/postfix/main.cf.orig

nano /etc/postfix/main.cf > postfix_main.cf

nano /etc/postfix/mysql-virtual-mailbox-domains.cf > mysql-virtual-mailbox-domains.cf

nano /etc/postfix/mysql-virtual-mailbox-maps.cf > mysql-virtual-mailbox-maps.cf 

nano /etc/postfix/mysql-virtual-alias-maps.cf > mysql-virtual-alias-maps.cf

nano /etc/postfix/mysql-virtual-email2email.cf > mysql-virtual-email2email.cf

sudo systemctl restart postfix

sudo cp /etc/postfix/master.cf /etc/postfix/master.cf.orig
