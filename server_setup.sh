#!/bin/bash

source functions/log.sh

username='libuk'

# Add user
log "creating user ${username}"

adduser ${username}

log "user ${username} created"

# Add user to sudo group
log "adding user ${username} to sudo group"

usermod -aG sudo ${username}

log "user ${username} added to sudo group"

# configuring firewall
# allow ssh
log "configuring firewall"

ufw allow OpenSSH
ufw enable

log "firewall configured"

log "set-up script complete"
