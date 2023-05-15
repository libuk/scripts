#!/bin/bash

# generates a new ssh key pair with the given name
#
# usage: $ bash ssh-setup-client.sh myserver
# 
# creates ~/.ssh/myserver & ~/.ssh/myserver.pub
#
source functions/log.sh

keyname=$1
keypath="$HOME/.ssh/$1"

if [ -f "$keypath" ]; then
  log "ssh key already exists: $keypath"
  exit 1
fi

log "creating ssh key $keypath"

# -o OpenSSH key format
# -t Type of key (ed25519, RSA, DSA etc.)
# -f output path
# -N passphrase
# -q quiet
command="ssh-keygen -o -t ed25519 -f $keypath -N '' -q"

log "executing command: $command"

eval $command

if [ -f "$keypath" ]; then
  log "ssh key created: $keypath"
else
  log "ssh key creation was unsuccesful"
  exit 1
fi

