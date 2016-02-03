#!/bin/bash
if [[ -z "$configured" ]]; then source $( cd $(dirname $0) ; pwd -P )/config.sh; fi

tomcat=$(pgrep tomcat)
java=$(pgrep java)

echo -e "Tomcat instances:"
echo -e $tomcat
echo -e "Java instances:"
echo -e $java

echo -e  "cd $TOMCAT/bin && bash shutdown.sh"
cd $TOMCAT/bin && bash shutdown.sh


while true; do
  tomcat=$(pgrep tomcat)
  if [[ "$tomcat" == "" ]]
  then
    echo "Tomcat is shut down."
    break
  else
    echo "waiting for Tomcat to shut down. sleep .1s."
    sleep .1s
  fi
done

javacount=0
while true; do
  java=$(pgrep java)
  if [[ "$java" == "" ]]
  then
    echo "Java is shut down."
    break
  elif (( "$javacount" >= 100 ))
  then
    echo "assuming that Java is shut down, but there's some other Java program running."
    echo -e "Java instances still running:"
    echo -e $java
    break
  else
    echo "waiting for Java to shut down. sleep .2s."
    sleep .2s
    javacount=$((javacount + 2))
  fi
done

say "tomcat is shutdown"
