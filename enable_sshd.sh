#!/bin/bash

source functions/log.sh

# Enable SSH
log "enabling SSH"

systemctl enable sshd

systemctl start sshd
