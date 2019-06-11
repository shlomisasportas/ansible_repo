#! /bin/bash

ansible-playbook -i /home/ubuntu/ansible_repo/inventory.yml /home/ubuntu/ansible_repo/install-docker.yml

ansible-playbook -i /home/ubuntu/ansible_repo/inventory.yml /home/ubuntu/ansible_repo/k8s-common.yml
ansible-playbook -i /home/ubuntu/ansible_repo/inventory.yml /home/ubuntu/ansible_repo/k8s-master.yml
ansible-playbook -i /home/ubuntu/ansible_repo/inventory.yml /home/ubuntu/ansible_repo/k8s-minion.yml

sleep 10

sudo chown -R ubuntu /home/ubuntu/.ansible

sudo service ssh restart

ansible-playbook -i /home/ubuntu/ansible_repo/inventory.yml /home/ubuntu/ansible_repo/wait_ssh.yml

ansible-playbook -i /home/ubuntu/ansible_repo/inventory.yml /home/ubuntu/ansible_repo/install-docker.yml

ansible-playbook -i /home/ubuntu/ansible_repo/inventory.yml /home/ubuntu/ansible_repo/k8s-common.yml
ansible-playbook -i /home/ubuntu/ansible_repo/inventory.yml /home/ubuntu/ansible_repo/k8s-master.yml
ansible-playbook -i /home/ubuntu/ansible_repo/inventory.yml /home/ubuntu/ansible_repo/k8s-minion.yml
