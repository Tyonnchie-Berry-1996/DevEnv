#!/bin/bash

set -e

echo "Setting Up Local Dev Environment"

dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

# Run Ansible playbook to set up local development environment
ansible-playbook playbook.yaml

echo "Dev Environment Setup Complete"

echo "Setting Up Python Environment"

# Ensure pip is installed and upgraded
python3 -m ensurepip --upgrade

# Upgrade pip, setuptools, and wheel
python3 -m pip install --no-cache-dir --upgrade pip setuptools wheel \
    --disable-pip-version-check \
    --no-python-version-warning \
    --no-warn-script-location

sh installer-help.sh

python3 -m pip install google-api-python-client

echo "Python 3 Setup Complete!"

rm -rf playbook.yaml

dnf -y install libxml2-devel libxslt-devel

dnf5 -y group install c-development

dnf5 -y group install development-tools

dnf5 -y group install core

cd /home

mkdir src

cd /home/src


clear

echo "Dev Container is now ready for use. To exit, use 'exit' command."

exec /bin/bash
