#!/bin/bash

echo "Option '1' Install and configure FTP"
echo "Option '2' Uninstall FTP"
echo "Option '3' Quit script"

echo "Choose an option : " | tr -d '\n';
read option 

case $option in
    "1")
    su-
    apt-get install -y proftpd-* ;apt-get install -y git; apt-get update -y ; apt-get upgrade -y; 

    cp /etc/proftpd/proftpd.conf /etc/proftpd/proftpd_backup.conf
    cp /etc/proftpd/tls.conf /etc/proftpd/tls_backup.conf
    cp /etc/proftpd/modules.conf /etc/proftpd/modules_backup.conf

    cp /etc/proftpd/proftpd.conf   
    cp /etc/proftpd/tls.conf   
    cp /etc/proftpd/modules.conf 

    cd /home
    git clone https://github.com/clement-ramos/git-config.git
    cd
    
    cp /home/git-config/git_proftpd.conf /etc/proftpd/proftpd.conf
    cp /home/git-config/git_tls.conf /etc/proftpd/tls.conf
    cp /home/git-config/git_modules.conf /etc/proftpd/modules.conf

    mkdir /etc/proftpd/ssl

    openssl req -x509 -nodes -days 365 -newkey rsa:4096 -out /etc/proftpd/ssl/proftpd-rsa.pem -keyout /etc/proftpd/ssl/proftpd-key.pem

    chmod 0600 /etc/proftpd/ssl/proftpd-key.pem

    rm -r git-config

    service proftpd restart

    echo "Configuration done !"
    ;;
        
    "2")
    apt-get -y remove proftpd-*
    apt-get -y purge proftpd-*
    echo " "
    echo "FTP has successfully been unistall."
    ;;   
 
    "3")
    exit
    ;;

    *)
    echo "Error : available option are 1, 2 or 3"
    ;;

