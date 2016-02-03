#!/bin/bash
if [[ -z "$configured" ]]; then source $( cd $(dirname $0) ; pwd -P )/config.sh; fi

say "would you like to play a game?"

source $SCRIPTPATH/powerkill.sh
echo -e $wave

say "deploy portal common"
  echo -e  "deploy common"
  echo -e  "cd $PORTAL/rhythm-common && mvn clean install"
  cd $PORTAL/rhythm-common && mvn clean install liferay:deploy
  echo -e  $wave

say "deploy portal portlets"
  echo -e  "deploy rhythm-portal"
  echo -e  "cd $PORTAL/rhythm-portlets && mvn clean package liferay:deploy"
  cd $PORTAL/rhythm-portlets && mvn clean package liferay:deploy -Dmaven.test.skip=true
  echo -e  $wave

say "ecom build all"
  echo -e  "run bash buildAll.sh"
  echo -e  "cd $ECOM/ && bash buildAll.sh"
  cd $ECOM/ && bash buildAll.sh
  echo -e  $wave

say "deploy ecom portlets"
  echo -e  "maven deploy rhythm-ecom/liferay-portlets"
  echo -e  "cd $ECOM/liferay-portlets/ && mvn clean package liferay:deploy -Dmaven.test.skip=true"
  cd $ECOM/liferay-portlets/ && mvn clean package liferay:deploy
  echo -e  $wave

say "deploy ecom liferay webs"
  echo -e  "maven deploy rhythm-ecom/liferay-webs"
  echo -e  "cd $ECOM/liferay-webs/ && mvn clean package liferay:deploy"
  cd $ECOM/liferay-webs/ && mvn clean package liferay:deploy
  echo -e  $wave

say "deploy ecom rest wrapper"
  echo -e  "maven deploy ecom rest wrapper"
  echo -e  "cd $ECOM/liferay-webs/ecom-rest-wrapper-web && mvn clean package liferay:deploy"
  cd $ECOM/liferay-webs/ecom-rest-wrapper-web && mvn clean package liferay:deploy
  echo -e  $wave

say "deploy portal rhythm webs localization"
  echo -e  "maven localization"
  echo -e  "cd $PORTAL/rhythm-webs/rhythm-localisation-web && mvn clean package liferay:deploy"
  cd $PORTAL/rhythm-webs/rhythm-localisation-web && mvn clean package liferay:deploy
  echo -e  $wave

say "deploy layouts"
  echo -e  "maven layouts"
  echo -e  "cd $PORTAL/rhythm-layouts && mvn clean package liferay:deploy"
  cd $PORTAL/rhythm-layouts && mvn clean package liferay:deploy
  echo -e  $wave

say "fix liferay"
  echo -e "fix Liferay"
  source $SCRIPTPATH/fixLiferay.sh
  echo -e $smallbreak

say "rebuild themes"
  echo "rebuild themes"
  source $SCRIPTPATH/buildThemes.sh
  echo -e $smallbreak

say "start up tomcat"
  echo -e  "start up tomcat"
  source $SCRIPTPATH/startTomcat.sh
  echo -e $smallbreak

echo -e $donewave
say "done"
