#!/usr/bin/env bash

function connect_device() {

	ip_addr=$(adb shell ip addr show wlan0 | grep 'inet ' | cut -d ' ' -f 6 | cut -d / -f 1)
	if [[ "$ip_addr" != "" ]]
		then
			adb tcpip 5555
			adb connect "$ip_addr":5555	
	fi
}

if adb get-state 1>/dev/null 2>&1
	then
		connect_device
	else
		echo -e '\nNo Device Attached\n'
		exit 1
fi
