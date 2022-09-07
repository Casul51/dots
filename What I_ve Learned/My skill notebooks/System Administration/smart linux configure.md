smart linux configure

1.  Choose "control" machine
2.  Install on it byobu, openssh
3.  run openssh with custom config
4.  copy byobu config
5.  move all VMs to same network (dont forget to write down their original networks)
6.  deal with IPs if needed (so, preferably to set it to NAT network with dhcp, so just run $dhclient to get ip)
7.  install and run on them ssh with custom config (allowing root login)
8.  add to control names of others to /etc/hosts
9.  ssh-copy-id
10. easy sftp connect and file distribute if needed + samba for windows
    \+ smbget
11. Enjoy clipboard and mouse support + multiple windows