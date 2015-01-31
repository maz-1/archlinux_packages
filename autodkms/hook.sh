#!/bin/sh
#while [ "`ps -ef | grep -P "\d\d:\d\d:\d\d pacman"`" != "" ]
while [[  -f /var/lib/pacman/db.lck ]]
do
    sleep 3
done
#dkms autoinstall -k ${KERNELVERSION}
	
if [ ! -d "/usr/lib/modules/$1/build" ]; then
    echo -e "\e[1m\e[33mYou need to install or update $1 headers before build kernel image.\e[0m"
    exit 1
fi
#if [ "`ps -ef | grep -P "\d\d:\d\d:\d\d dkms"`" = "" ]; then
touch /tmp/dkms.status
if [ "`cat /tmp/dkms.status`" == "$1" ]; then
	echo "SKIP"
	rm /tmp/dkms.status
else
    echo "Building dkms modules for $1 kernel..."
    echo "$1" > /tmp/dkms.status
    if [ "$2" == "update" ]; then
        dkms autoinstall -k $1 1> /tmp/dkms.log 2>&1
    else
        dkms autoinstall -k $1
    fi    
    echo "Build complete."
    #rm /tmp/dkms.status
    #systemctl restart dkms
fi
#echo OK >> /tmp/test.log
exit 0