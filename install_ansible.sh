#! /bin/bash

sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update -y
sudo apt-get install ansible -y

sleep 20

until sudo chown -R ubuntu /home/ubuntu/.ansible; do echo "Retrying"; sleep 5; done
ansible-playbook -i /home/ubuntu/ansible_repo/inventory.yml /home/ubuntu/ansible_repo/install-docker.yml

ansible-playbook -i /home/ubuntu/ansible_repo/inventory.yml /home/ubuntu/ansible_repo/k8s-common.yml
ansible-playbook -i /home/ubuntu/ansible_repo/inventory.yml /home/ubuntu/ansible_repo/k8s-master.yml
ansible-playbook -i /home/ubuntu/ansible_repo/inventory.yml /home/ubuntu/ansible_repo/k8s-minion.yml
