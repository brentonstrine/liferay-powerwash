#!/bin/bash
if [[ -z "$configured" ]]; then source $( cd $(dirname $0) ; pwd -P )/config.sh; fi
  echo -e $smallbreak

cp $SCRIPTPATH/marketplace-portlet-6.2.0.3.war $LIFERAY/deploy/marketplace-portlet-6.2.0.3.war
