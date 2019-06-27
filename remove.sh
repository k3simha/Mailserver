systemctl stop dovecot
systemctl disable dovecot
apt-get purge dovecot-core
apt-get autoremove dovecot-core

sudo apt-get remove --purge mysql*
sudo apt-get purge mysql*
sudo apt-get autoremove
sudo apt-get autoclean
sudo apt-get remove dbconfig-mysql
sudo apt-get dist-upgrade
sudo apt-get install mysql-server

sudo apt-get purge postfix
