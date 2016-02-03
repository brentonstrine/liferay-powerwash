#!/bin/bash
if [[ -z "$configured" ]]; then source $( cd $(dirname $0) ; pwd -P )/config.sh; fi

source $SCRIPTPATH/shutdownTomcat.sh
echo -e  $smallwave

echo -e  "delete all items in temp"
mkdir $SCRIPTPATH/safety && cd $SCRIPTPATH/safety
cd $TOMCAT/temp/
rm -rf *
echo -e  $smallwave

echo -e  "delete all items in work"
mkdir $SCRIPTPATH/safety && cd $SCRIPTPATH/safety
rm -rf $TOMCAT/work/*
echo -e  $smallwave

# echo -e  "delete selected webapps items"
# mkdir $SCRIPTPATH/safety && cd $SCRIPTPATH/safety
# cd $TOMCAT/webapps
# rm -rf rhythm-*
# rm -rf ~rhythm-tenant-provisioning-web/
# rm -rf ecom-rest-wrapper-web/
# echo -e  $smallwave

# echo -e  "delete select items from data"
# mkdir $SCRIPTPATH/safety && cd $SCRIPTPATH/safety
# cd $LIFERAY/data
# rm -r document_library
# rm -r jackrabbit
# rm -r lucene
# rm -r opensocial
# rm -r osgi
# #rm -r hsql
# echo -e  $smallwave

say "powerkill is complete"
