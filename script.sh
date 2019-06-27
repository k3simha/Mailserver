sudo su
apt-get update
apt-get install software-properties-common
add-apt-repository ppa:certbot/certbot
apt-get update
apt-get install python-certbot-nginx
certbot --nginx

echo Enter your domain name
read domain_name

apt-get install postfix postfix-mysql dovecot-core dovecot-imapd dovecot-pop3d dovecot-lmtpd dovecot-mysql mysql-server

mysql_secure_installation

mysqladmin -u root -p create mailserver

mysql -u root -pNarsimha@1998 < sqlscript.sql

cp /etc/postfix/main.cf /etc/postfix/main.cf.orig
 
sed "s/example.com/$domain_name/g" postfix_main.cf > /etc/postfix/main.cf

cp mysql-virtual-mailbox-domains.cf /etc/postfix/mysql-virtual-mailbox-domains.cf 

cp mysql-virtual-mailbox-maps.cf /etc/postfix/mysql-virtual-mailbox-maps.cf 

cp mysql-virtual-alias-maps.cf /etc/postfix/mysql-virtual-alias-maps.cf 

cp mysql-virtual-email2email.cf /etc/postfix/mysql-virtual-email2email.cf 

systemctl restart postfix

cp /etc/postfix/master.cf /etc/postfix/master.cf.orig

cp postfix_master.cf /etc/postfix/master.cf

chmod -R o-rwx /etc/postfix

systemctl restart postfix

#configuring Dovecot

cp /etc/dovecot/dovecot.conf /etc/dovecot/dovecot.conf.orig
cp /etc/dovecot/conf.d/10-mail.conf /etc/dovecot/conf.d/10-mail.conf.orig
cp /etc/dovecot/conf.d/10-auth.conf /etc/dovecot/conf.d/10-auth.conf.orig
cp /etc/dovecot/dovecot-sql.conf.ext /etc/dovecot/dovecot-sql.conf.ext.orig
cp /etc/dovecot/conf.d/10-master.conf /etc/dovecot/conf.d/10-master.conf.orig
cp /etc/dovecot/conf.d/10-ssl.conf /etc/dovecot/conf.d/10-ssl.conf.orig

cp dovecot.conf /etc/dovecot/dovecot.conf

cp 10-mail.conf /etc/dovecot/conf.d/10-mail.conf
sed "s/example.com/$domain_name/g" 10-ssl.conf > /etc/dovecot/conf.d/10-ssl.conf

mkdir -p /var/mail/vhosts/example.com

sudo groupadd -g 5000 vmail
sudo useradd -g vmail -u 5000 vmail -d /var/mail

sudo chown -R vmail:vmail /var/mail

cp 10-auth.conf /etc/dovecot/conf.d/10-auth.conf

cp auth-sql.conf.ext /etc/dovecot/conf.d/auth-sql.conf.ext

sed "s/example.com/$domain_name/g" sql.conf.ext > /etc/dovecot/dovecot-sql.conf.ext

chown -R vmail:dovecot /etc/dovecot
chmod -R o-rwx /etc/dovecot

cp 10-master.conf /etc/dovecot/conf.d/10-master.conf

sudo systemctl restart dovecot
