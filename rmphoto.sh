#!/bin/sh
am start -n com.android.camera2/com.android.camera.CameraLauncher
j=1
jmax=10
touch /data/count.txt
chmod 777 /data/count.txt
while [ $j -lt $jmax ];do
	input tap 1148 388
	echo "$j" > /data/count.txt
	j=$((j+1))
	sleep 2
done
cd /
cd /sdcard
rm -rf DCIM
am broadcast -a android.intent.action.MEDIA_MOUNTED -d file:///sdcard