# mailserver
Script.sh is a bash script written to directly create a mailserver of your own using Postfix, Dovecot, SquirrelMail and AWS.

Prerequisites:
1. An AWS EC2 instance with HTTP, HTTPS, IMAP, IMAPS, POP3, POP3S, SMTP and SSH ports open.
2. A domain of your own with an A record pointing to the AWS instance.

To Create the mail server, follow the steps given below: 
1. Connect to your EC2 instance using putty and enter the following command to open a root session.

                                                        sudo su
                                                        
2. Enter the following command to clone the git repositry
