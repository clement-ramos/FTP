
# Configuration FTPS

In this file you will find all the actions you need 
to configure a TLSserver

apt install proftpd-*

apt update/upgrade

### nano /etc/proftpd/proftpd.conf

UseIPv6                         off

IdentLookups                    off

ServerName                      "Debian"

### nano /etc/proftpd/proftpd.conf

Include /etc/proftpd/tls.conf

mkdir /etc/proftpd/ssl

openssl req -x509 -nodes -days 365 -newkey rsa:4096 -out /etc/proftpd/ssl/proftpd-rsa.pem -keyout /etc/proftpd/ssl/proftpd-key.pem

chmod 0600 on key

### nano /etc/proftpd/tls.conf

TLSEngine                               on

TLSLog                                  /var/log/proftpd/tls.log

TLSProtocol                             SSLv23


TLSRSACertificateFile                   /etc/proftpd/ssl/proftpd-rsa.pem

TLSRSACertificateKeyFile                /etc/proftpd/ssl/proftpd-key.pem

### nano /etc/proftpd/tls.conf 

TLSRequired                             on

TLSOptions                                AllowClientRenegotiations

TLSRenegotiate                          required off

### nano /etc/proftpd/modules.conf 

LoadModule mod_tls.c

sudo reboot
service proftpd restart

###########################################

add anonymous 

merry pippin

