# mailserver
Script.sh is a bash script written to directly create a mailserver of your own using Postfix, Dovecot, SquirrelMail and AWS.

Prerequisites:
1. An AWS EC2 instance with HTTP, HTTPS, IMAP, IMAPS, POP3, POP3S, SMTP and SSH ports open.
2. A domain of your own with an A record pointing to the AWS instance.

To Create the mail server, follow the steps given below: 
1. Connect to your EC2 instance using putty and enter the following command to open a root session.

                                                        sudo su
                                                        
2. Enter the following command to clone the git repositry on to your instance.
                                                        
                                    git clone https://github.com/k3simha/mailserver.git
                                    
3. Change the directory to the mailserver
                                                 
                                                      cd mailserver
                                                 
4. Change the permissions of the scripts.sh file.
                                        
                                                  chmod +x scripts.sh

5. Run the file 

                                                      ./script.sh

Enter all the details required and the mail server will be ready.

Considering example.com as your domain
To open the login page for your mailserver, open example.com/squirrelmail
By default, the email IDs created will be:
1. Email, PASSWORD - email1@example.com, password
2. Email, PASSWORD - email2@example.com, password

Steps to add a new email into the database:
1. Open MySql by entering the following in the terminal:

                                                  sudo -u root -p
                                                  
2. Then, enter the MYSQL password that you have set and then set the database as mailserver

                                                   USE mailserver

3. Then enter the following, don't forget to replace example.com and password with the domain name and password that you want.

                                INSERT INTO `mailserver`.`virtual_users`
                                (`domain_id`, `password` , `email`)
                                VALUES
                                ('5', ENCRYPT('password', CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))) , 'email3@example.com');
                                       
4. Verify that the new email address has been added. The new email address should be displayed in the output:
                                          
                                          SELECT * FROM mailserver.virtual_users;
                                          
5. Exit MySQL:

                                                          quit
                                                          
NOTE: If you see that an error that make sure that you have set the A domain correctly even having a proper A record in the DNS management of domain, then give some time gap before running the code again. This error might because of the reason that once you update a DNS record in your domain it might take some time to get updated, and the domain certificate that you need to obtain to establish a mail server will need the A record in the domain to be set.


If you see an error like mentioned below when you open the mail login page,

                                        ERROR
                                        Error connecting to IMAP server: localhost.
                                        111 : Connection refused
                                        
The reason for this might be that IMAP is supposed to be hearing at port 143 but it is not, then

                                                service postfix restart
                                                service dovecot restart
                                                
Then if you see any error after executing them, then solve them and try to open the login page again.
