#!/bin/bash
if [[ -z "$configured" ]]; then source $( cd $(dirname $0) ; pwd -P )/config.sh; fi



echo -e  "cd $PORTAL/rhythm-themes/rhythm-default-base-theme && mvn install"
cd $PORTAL/rhythm-themes/rhythm-default-base-theme && mvn install
say "default base theme installed"

echo -e $smallbreak

echo -e  "cd $PORTAL/rhythm-themes/rhythm-default-base-theme && mvn clean package liferay:deploy"
cd $PORTAL/rhythm-themes/rhythm-default-base-theme && mvn clean package liferay:deploy
say "default base theme built"

echo -e $smallbreak

echo -e  "cd $PORTAL/rhythm-themes/rhythm-cycleurope-theme && mvn clean package liferay:deploy"
cd $PORTAL/rhythm-themes/rhythm-cycleurope-theme && mvn clean package liferay:deploy
say "cycle europe built"

say "themes built"
