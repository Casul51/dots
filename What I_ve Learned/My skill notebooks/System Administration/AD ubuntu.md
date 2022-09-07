hostnamectl set-hostname ubi-1.root.hard

\*edit /etc/hosts - 127.0.1.1 ubi1.root.hard\*

apt install sssd realmd

pam-auth-update --enable mkhomedir

*\*set dns to root.hard IP\*

*realm -U administrator root.hard

nano /etc/sssd/sssd.conf

"

\[sssd\]

default\_domain\_suffix = root.hard

"

systemctl restart sssd
