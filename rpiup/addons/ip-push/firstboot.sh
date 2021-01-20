#!/bin/bash

# THIS STARTS AN ANONYMOUS FUNCTION TO REDIRECT ALL OUTPUT TO FILE
{
# ----------------------------------------------------------------

# expand empty glob to empty string, not original pattern
shopt -s nullglob

UTILS_FILE='/boot/boot-utils.sh'
. $UTILS_FILE
echo ". $UTILS_FILE" >> /etc/profile.d/firstboot.sh


# if we've already finished, exit.

if [ "$(status.list done)" ]; then
    [ -f /boot/firstboot.sh ] && mv /boot/firstboot.sh /boot/firstboot.sh.done
    exit 0;
fi

########################################
# Setup
########################################

# create a general workspace
mkdir -p /etc/firstboot
cd /etc/firstboot

status.update start ip=$(localip)

# THIS CREATES AN ANONYMOUS FUNCTION TO REDIRECT ALL OUTPUT TO FILE
} &> /var/log/firstboot.log
# -----------------------------------------------------------------
