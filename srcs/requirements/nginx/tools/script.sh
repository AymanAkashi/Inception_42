#!/bin/sh
#   _   _   _     _   _   _   _   _   _   _   _   _   _   _  
#  / \ / \ / \   / \ / \ / \ / \ / \ / \ / \ / \ / \ / \ / \ 
# ( S | S | L ) ( C | e | r | t | i | f | i | c | a | t | e )
#  \_/ \_/ \_/   \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ 

# *************************************************************************** #
apk add --no-cache nginx openssl
mkdir -p /etc/nginx/ssl
openssl req -x509 -new -newkey rsa:4096 -nodes -keyout /etc/nginx/ssl/aaggoujj.key -out /etc/nginx/ssl/aaggoujj.crt -subj "/C=MA/ST=/L=/O=/OU=/CN=aaggoujj.42.fr"
# *************************************************************************** #
