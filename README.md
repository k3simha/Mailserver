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
1. Email - email1@example.com
