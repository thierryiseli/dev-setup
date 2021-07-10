#!/usr/bin/env bash
cd /home/vagrant
mkdir /home/vagrant/projects
cd projects
git config --global credential.helper 'store --file ~/.my-credentials'
git config --global user.email ${GIT_EMAIL}
git config --global user.name ${GIT_NAME}
git clone -b ${BRANCH} https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/${REPOSITORY} setup
cd setup
ansible-galaxy install -r requirements.yml
ansible-playbook playbook.yml