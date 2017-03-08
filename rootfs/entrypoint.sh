#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Init semaphore
INIT_SEM=/tmp/initialized.sem

fresh_container() {
  [ ! -f $INIT_SEM ]
}

log() {
  echo -e "\033[0;33m$(date "+%H:%M:%S")\033[0;37m ==> $1."
}

if fresh_container; then
  touch $INIT_SEM
fi

exec "$@"
