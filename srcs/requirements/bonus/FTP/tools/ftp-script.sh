#!/bin/sh

# 			  ____             __ _          __ _         					   #
# 			 / ___|___  _ __  / _(_) __ _   / _| |_ _ __  					   #
# 			| |   / _ \| '_ \| |_| |/ _` | | |_| __| '_ \ 					   #
# 			| |__| (_) | | | |  _| | (_| | |  _| |_| |_) |					   #
# 			 \____\___/|_| |_|_| |_|\__, | |_|  \__| .__/ 					   #
# 			                        |___/          |_|    					   #

chmod 755 /etc/vsftpd.conf


adduser $FTP_USER --disabled-password

echo "$FTP_USER:$FTP_PASS" | chpasswd
# Create the ftp folder
mkdir -p /var/www/html/$FTP_USER/ftp
# set its ownership
chown -R $FTP_USER:$FTP_USER /var/www/html/$FTP_USER/ftp
# Remove write permissions
chmod a-w /var/www/html/$FTP_USER/ftp 

# disables anonymous login to the FTP server
echo "anonymous_enable=NO" >> /etc/vsftpd.conf;
# enables write permissions for the FTP users.
echo "write_enable=YES" >> /etc/vsftpd.conf;
# sets the chroot jail for local users to their home directory
echo "chroot_local_user=YES" >> /etc/vsftpd.conf;
# allows write access for local within their chroot jail
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf;
# set the FTP_USER as user substitution token
echo "user_sub_token=$FTP_USER" >> /etc/vsftpd.conf
# enables local user login
echo "local_enable=YES" >> /etc/vsftpd.conf
# line sets the FTP root directory for the local user to /var/www/html
echo "local_root=/var/www/html" >> /etc/vsftpd.conf
# sets the minimum port for passive mode data connections
echo "pasv_min_port=30000" >> /etc/vsftpd.conf
# sets the maximum port for passive mode data connections
echo "pasv_max_port=30009" >> /etc/vsftpd.conf
# enables the use of the userlist_file option
echo "userlist_enable=YES" >> /etc/vsftpd.conf
# sets the path to the userlist file
echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf
# sets that the file's contents will be used to specify users who are NOT allowed to log in
echo "userlist_deny=NO" >> /etc/vsftpd.conf
# appends the value of the FTP_USER variable to the userlist file.
echo "$FTP_USER" | tee -a /etc/vsftpd.userlist
echo "pasv_enable=YES" >> /etc/vsftpd.conf
#when disabling this (setting seccomp_sandbox=NO) the directory listing works as intended.
echo "seccomp_sandbox=NO" >> /etc/vsftpd.conf

vsftpd /etc/vsftpd.conf