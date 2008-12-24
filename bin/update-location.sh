#!/bin/sh

# For Mac OS X 10.5 (Leopard)

# Figure out the SSID of the current WLAN
ssid=`ioreg -l -n AirPortDriver | grep APCurrentSSID | sed 's/^.*= "\(.*\)".*$/\1/; s/ /_/g'`

if [ "$ssid" = "Grunk" ]; then
    location="Hemma"
elif [ "$ssid" = "Venture_Zone" ]; then
    location="Venture Zone"
elif [ "$ssid" = "LiU" ]; then
    location="LiU"
else
    location="Automatic"
fi

# Change to the correct location
new_location=`/usr/sbin/scselect "${location}" | sed 's/^.*(\(.*\)).*$/\1/'`

echo ${new_location}

if [ "${location}" != "${new_location}" ]; then
    exit 1
else
	exit 0
fi
