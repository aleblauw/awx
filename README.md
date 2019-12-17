# Install AWX with AWX in Vagrant
Purpose of this is to start up two CentOS boxes and to install manually AWX on the first machine (ansible-awx) and install AWX on the second machine (ansible-lab). Here you will find the Vagrantfile you can use to fire up two CentOS machines.

## Make Vagrant ready

Download Vagrant from https://www.vagrantup.com/downloads.html
Create a folder in the vagrant folder eq c:\vagrant\awx
Download Vagrantfile to the newly created folder https://raw.githubusercontent.com/aleblauw/awx/master/Vagrantfile

## Bring up the two CentOS servers

vagrant up awx lab

## Install AWX form bash
vagrant ssh awx
curl https://raw.githubusercontent.com/aleblauw/awx/master/install_awx.sh | bash 


