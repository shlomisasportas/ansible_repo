#! /bin/bash

sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update -y
sudo apt-get install ansible -y

sleep 15


sudo ansible-playbook -i /home/ubuntu/ansible_repo/inventory.yml /home/ubuntu/ansible_repo/install-docker.yml

sudo ansible-playbook -i /home/ubuntu/ansible_repo/inventory.yml /home/ubuntu/ansible_repo/k8s-common.yml
sudo ansible-playbook -i /home/ubuntu/ansible_repo/inventory.yml /home/ubuntu/ansible_repo/k8s-master.yml
sudo ansible-playbook -i /home/ubuntu/ansible_repo/inventory.yml /home/ubuntu/ansible_repo/k8s-minion.yml
