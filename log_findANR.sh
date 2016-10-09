#!/system/bin/sh
i=0
touch /data/result.txt
chmod 777 /data/result.txt
while read LINE
do
if echo $LINE | grep "ANR"
then
	i=$((i+1))
	echo $LINE >> result.txt
fi
done < ss.txt