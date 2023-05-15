#!/bin/bash

# changes the following options in /etc/ssh/sshd_config
# 
# Enables PubkeyAuthentication
# Disables PasswordAuthentication
# Disables PermitRootLogin
#
source functions/log.sh

config_file="/etc/ssh/sshd_config"
config_file_old="${config_file}_old"

temp_file=$(mktemp)

# Ensure the temporary file is deleted when the script exits
trap 'rm -f "$temp_file"' EXIT

log "creating a backup of $config_file in $config_file_old"
cp $config_file $config_file_old

# Use awk to process the file line by line
awk '
    /^#?PasswordAuthentication/ {
        print "PasswordAuthentication no";
        found_password_authentication=1;
        next
    }

    /^#?PermitRootLogin/ {
        print "PermitRootLogin no";
        found_permit_root_login=1;
        next
    }

    /^#?PubkeyAuthentication/ {
        print "PubkeyAuthentication yes";
        found_pubkey=1;
        next
    }

    {print}

    END {
        if (!found_password_authentication) print "PasswordAuthentication no"
        if (!found_permit_root_login) print "PermitRootLogin no"
        if (!found_pubkey) print "PubkeyAuthentication yes"
    }
' "$config_file" > "$temp_file"

mv "$temp_file" "$config_file"

log "new config: $config_file"

