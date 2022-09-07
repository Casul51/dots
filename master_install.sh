#!/bin/bash




if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi


cd ~
apt update

# install some net tools
apt install -y curl wget openssh-server ssh sambaclient git
#yum install -y curl wget

# install micro
curl https://getmic.ro | bash

# install byobu
apt install -y byobu
#yum install -y byobu


# install fish
apt install -y fish
#yum install -y fish


# configure byobu
git clone https://github.com/Casul51/dots


cp -r dots/.byobu .


echo 'PermitRootLogin yes' >  /etc/ssh/sshd_config

mkdir /share


ssh-keygen

systemctl enable --now sshd
systemctl restart sshd

echo ""
echo "bash ./master_ssh-id.sh"
echo "smbget smb://server_ip/folder/file"

