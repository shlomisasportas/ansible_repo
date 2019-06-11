#! /bin/bash

apt-add-repository ppa:ansible/ansible -y
apt-get update -y
apt-get install ansible -y

sleep 15


ansible-playbook -i /home/ubuntu/ansible_repo/inventory.yml /home/ubuntu/ansible_repo/install-docker.yml

ansible-playbook -i /home/ubuntu/ansible_repo/inventory.yml /home/ubuntu/ansible_repo/k8s-common.yml
ansible-playbook -i /home/ubuntu/ansible_repo/inventory.yml /home/ubuntu/ansible_repo/k8s-master.yml
ansible-playbook -i /home/ubuntu/ansible_repo/inventory.yml /home/ubuntu/ansible_repo/k8s-minion.yml
