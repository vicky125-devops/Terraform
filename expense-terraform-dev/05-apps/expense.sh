#!/bin/bash
apt install ansible -y
cd /tmp
git clone https://github.com/vicky125-devops/expense-ansible-roles.git
cd expense-ansible-roles
ansible-playbook main.yaml -e component=backend -e login_password=ExpenseApp1
ansible-playbook main.yaml -e component-frontend