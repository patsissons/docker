#!/bin/sh

SSH_CONF=$HOME/.ssh
KEYS_FILE=$SSH_CONF/authorized_keys
SCREEN_NAME=irc
KEY_PREFIX=command="screen -rD $SCREEN_NAME",no-port-forwarding,no-X11-forwarding,no-pty

if [ -n "$AUTHORIZED_KEYS" ]; then
  mkdir -p $SSH_CONF
  chmod 700 $SSH_CONF
  touch $KEYS_FILE
  chmod 600 $KEYS_FILE

  # internal field separator, required to split on \n
  IFS=$'\n'
  
  for key in $(echo ${AUTHORIZED_KEYS} | tr "," "\n"); do
    key=$(echo $key | sed -e 's/^ *//' -e 's/ *$//')
    echo "=> Adding public key to .ssh/authorized_keys: $key"
    echo "$KEY_PREFIX $key" >> $KEYS_FILE
  done
else
  echo "ERROR: No AUTHORIZED_KEYS specified"
  exit 1
fi

screen -S $SCREEN_NAME -d -m irssi

exec "$@"
