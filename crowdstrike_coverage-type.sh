#!/bin/bash
# set -x

####################################################################################################
# Script Name:  Crowdstrike-Complete_or_Lite.sh
# By:  Chris Adcock / Created:  12/15/22
# Version:  1.0.1
#
# Description:  A Jamf Pro Extension Attribute to check whether a device is part of the Crowdstrike COMPLETE
# or LITE coverage group within an environment containing multiple coverage levels of the Crowdstrike | Falcon sensor in production;
# where COMPLETE is FULL coverage by the/a Falcon Complete Team and LITE is AV/EndPoint Protection only.
#
# Updates:  Updates will be needed in the event one or more associated CIDs change
#
####################################################################################################

#Find and set the CID variable
CID=$(/Applications/Falcon.app/Contents/Resources/falconctl stats | grep customerID | awk -F": " '{print $2}' )

#Set up the different CIDs in use by your organization. Add additional variables as needed for >2 CIDs
LITECID="YOURORGANIZATIONSCID1"
COMPLETECID="YOURORGANIZATIONSCID2"

	# Set up the function
	if [[ "$CID" = "$LITECID" ]]; then
		echo "<result>LITE</result>"
	elif [[ "$CID" = "$COMPLETECID" ]]; then
		echo "<result>COMPLETE</result>"
	else
		echo "<result>Not Installed</result>"
fi
