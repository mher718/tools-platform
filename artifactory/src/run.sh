#!/bin/bash
#===============================================================================
#
#          FILE:  run.sh
#         USAGE:  ./run.sh 
#   DESCRIPTION:  Run Artifactory
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Aleksandr Bezpalko <a.bezpalko@external.oberthur.com>
#       COMPANY:  Oberthur
#       VERSION:  1.0
#       CREATED:  02.04.15 04:39:19 EDT
#      REVISION:  ---
#===============================================================================

if [ -n "LICENSE" ] ; then
	echo $LICENSE > /opt/artifactory/etc/artifactory.lic
fi

exec /opt/artifactory/bin/artifactory.sh
