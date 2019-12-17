sudo -i
sed -i 's/nameserver.*/nameserver 8.8.8.8 /g' /etc/resolv.conf
yum install -y epel-release
yum install -y yum-utils device-mapper-persistent-data lvm2 ansible git python3-devel python3-pip vim-enhanced gcc gcc-c++ nodejs gettext bzip2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce -y
systemctl start docker
systemctl enable --now docker.service
pip3 install docker-compose
git clone https://github.com/ansible/awx.git
cd awx/installer
sed -i 's/#awx_alternate_dns.*/awx_alternate_dns_servers="8.8.8.8"/g' inventory
sed -i 's/#project_data_dir=/project_data_dir=/g' inventory
sed -i 's/#ca_trust_dir=/ca_trust_dir=/g' inventory
ansible-playbook -i inventory install.yml -vv
sed -i 's/env python/python3/g' inventory
ansible-playbook -i inventory install.yml -vv
docker logs -f awx_task
