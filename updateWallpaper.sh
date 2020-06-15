#!/bin/bash -e
user=$(whoami)
now=`date +"%F-%R"`
time=$(curl https://www.wpc.ncep.noaa.gov/html/sfc-zoom.php|grep 'h0 = "..";' | grep -E -o '[[:digit:]]{2}')
echo "${time}"
curl https://www.wpc.ncep.noaa.gov/sfc/lrgnamsfc${time}wbg.gif> /tmp/lrgnamsfc${time}wbg-${now}.gif

fl=$(find /proc -maxdepth 2 -user $user -name environ -print -quit)
while [ -z $(grep -z DBUS_SESSION_BUS_ADDRESS "$fl" | cut -d= -f2- | tr -d '\000' ) ]
do
  fl=$(find /proc -maxdepth 2 -user $user -name environ -newer "$fl" -print -quit)
done
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS "$fl" | cut -d= -f2-)

gsettings set org.gnome.desktop.background picture-uri "/tmp/lrgnamsfc${time}wbg-${now}.gif"

echo -e "Updated wallpeper with latest image from NOAA as of ${now}. $(date): /tmp/lrgnamsfc${time}wbg-${now}.gif" >> /tmp/wallch.log


