#!/bin/bash

OLD_KEY=~/.ssh/pulse_dsa
NEW_KEY=~/.ssh/pulse_rsa
SSH_OPTS="-q -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"
 
START_TIME=$(date -u +%s)
if [ -n "$1" ]; then
    echo "Trying OLD SSH key..."
    ssh $SSH_OPTS -i $OLD_KEY root@$1
    if [ $? -ne 0 ]; then
        #
        # SSH session will exit with non-zero value if pulse terminates
        # the connection (sw update, reboot, etc)
        # Add a sleep to differentiate between a failed login
        # attempt and a pulse reboot.
        #
        CURR_TIME=$(date -u +%s)
        ((DELTA = $CURR_TIME - $START_TIME))
        if [ $DELTA -le 2 ]; then
            echo "Trying NEW SSH key..."
            ssh $SSH_OPTS -i $NEW_KEY root@$1
        fi
    fi
fi