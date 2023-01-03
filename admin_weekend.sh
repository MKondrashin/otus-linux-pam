#!/bin/bash
ADMIN_REGEX=".*admin.*"
if [ $(date +%a) = "Sat" ] || [ $(date +%a) = "Sun" ]; then
 if [[ $(groups $PAM_USER) =~ $ADMIN_REGEX ]]; then
 exit 0
 else
  exit 1
 fi
fi