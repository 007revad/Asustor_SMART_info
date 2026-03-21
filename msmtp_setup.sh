#!/usr/bin/env bash

# Configuration Variables
EMAIL="your_email@gmail.com"
APP_PASSWORD="YOUR_16_CHAR_APP_PASSWORD" # Generate this from your Google Account Security settings
SMTP_HOST="smtp.gmail.com"
SMTP_PORT="587"
DEFAULT="yes"

#------------------------------------------------------------------------------

LOG_FILE="~/.msmtplog"
CONFIG_FILE="/usr/builtin/etc/msmtp/msmtprc"
CA_CERT_PATH="/usr/builtin/etc/msmtp/ca-certificates.crt"

# Backup msmtp config file
if [[ ! -f "${CONFIG_FILE}.bak" ]]; then
    echo "Backing up existing msmtp config file"
    cp -p "${CONFIG_FILE}" "${CONFIG_FILE}.bak"
fi

# Append new account if it does not exist already
if ! grep -q "account $EMAIL" "$CONFIG_FILE"; then 
    echo -e "Adding new email account to msmtp configuration file:\n $CONFIG_FILE"
    #echo -e "\n" >> "$CONFIG_FILE"
    cat <<EOF >> "$CONFIG_FILE"

# The SMTP server of the provider.
account $EMAIL
host $SMTP_HOST
port $SMTP_PORT
from $EMAIL
auth on
user $EMAIL
password $APP_PASSWORD
EOF
else
    echo -e "$EMAIL account already exists in msmtp configuration file"
fi

# Set default account if not set
if [[ "$DEFAULT" == "yes" ]]; then
    if ! grep -qE ^"account default: " "$CONFIG_FILE"; then 
        echo "Setting new $EMAIL as the default account"
        cat <<EOFDEFAULT >> "$CONFIG_FILE"

# Set a default account
account default: $EMAIL
EOFDEFAULT
    else
        echo -e "Default account $EMAIL already exists in msmtp configuration file"
    fi
fi

echo -e "\nYou can test msmtp with the following command:"
echo "echo -e \"Subject: Test\n\nTest email.\" | msmtp --debug recipient@example.com"

