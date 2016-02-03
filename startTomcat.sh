#!/bin/bash
if [[ -z "$configured" ]]; then source $( cd $(dirname $0) ; pwd -P )/config.sh; fi

echo "bash $TOMCAT/bin/startup.sh"
bash $TOMCAT/bin/startup.sh

tomcat=$(pgrep tomcat)

while true; do
  tomcat=$(pgrep tomcat)
  if [[ "$tomcat" == "" ]]
  then
    echo "Waiting for Tomcat to start up. Sleep 1s."
    sleep 1s
  else
    say "Tomcat process detected."
    break
  fi
done
say "Tomcat Started"
