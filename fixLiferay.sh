#!/bin/bash
if [[ -z "$configured" ]]; then source $( cd $(dirname $0) ; pwd -P )/config.sh; fi
  echo -e $smallbreak
  echo -e  "maven build login"
  cd $PORTAL/rhythm-portlets/rhythm-login-portlet && mvn clean package liferay:deploy -DskipTests
  echo -e $smallbreak
  echo -e  "maven build login hook"
  cd $PORTAL/rhythm-hooks/rhythm-login-hook && mvn clean package liferay:deploy -Dmaven.test.skip=true
  echo -e $smallbreak
  echo -e  "maven build currency"
  cd $PORTAL/rhythm-portlets/rhythm-currency-portlet && mvn clean package liferay:deploy -DskipTests
echo -e  $wave

echo "manually deploy war files"
cp $SCRIPTPATH/marketplace-portlet-6.2.0.3.war $LIFERAY/deploy/marketplace-portlet-6.2.0.3.war
cp /Users/brenton.strine/projects/infor/rhythm-portal/rhythm-portlets/rhythm-login-portlet/target/rhythm-login-portlet.war $LIFERAY/deploy/rhythm-login-portlet.war
cp /Users/brenton.strine/projects/infor/rhythm-portal/rhythm-hooks/rhythm-login-hook/target/rhythm-login-hook.war $LIFERAY/deploy/rhythm-login-hook.war
cp /Users/brenton.strine/projects/infor/rhythm-portal/rhythm-portlets/rhythm-currency-portlet/target/rhythm-currency-portlet.war $LIFERAY/deploy/rhythm-currency-portlet.war
