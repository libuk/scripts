#!/bin/bash

username='libuk'

# Add user
echo "===> creating user ${username}"

adduser ${username}

echo "===> user ${username} created"

# Add user to sudo group
echo "===> adding user ${username} to sudo group"

usermod -aG sudo ${username}

echo "===> user ${username} added to sudo group"

# configuring firewall
# allow ssh
echo "===> configuring firewall"

ufw allow OpenSSH
ufw enable

echo "===> firewall configured"

# Copy ssh keys from root to user
echo "===> copying ssh keys from root to ${username}"

rsync --archive --chown="${username}:${username}" ~/.ssh "/home/${username}"

echo "===> ssh keys copied"

echo "===> set-up script complete"
