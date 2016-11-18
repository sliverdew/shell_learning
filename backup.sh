#!/bin/sh
# mysql data backup script
#
# use mysqldump --help,get more detail.
#
BakDir=/root/back/ysqlbackup
LogFile=/root/back/mysql/mysqlbak.log
DATE=`date +%Y%m%d%H%M%S`
echo " " >> $LogFile
echo " " >> $LogFile
echo "-------------------------------------------" >> $LogFile
echo $(date +"%y-%m-%d %H:%M:%S") >> $LogFile
echo "--------------------------" >> $LogFile
cd $BakDir
DumpFile=$DATE.sql
GZDumpFile=$DATE.sql.tar.gz
/usr/local/bin/mysqldump -u user -pname  --database -h 127.0.0.1 db> $DumpFile
echo "Dump Done" >> $LogFile
tar czvf $GZDumpFile $DumpFile >> $LogFile 2>&1
echo "[$GZDumpFile]Backup Success!" >> $LogFile
rm -f $DumpFile
#cd $BakDir/daily
cd $BakDir  
echo "Backup Done!"
echo "please Check $BakDir Directory!"
echo "copy it to your local disk or ftp to somewhere !!!"
find $BakDir -ctime +30 -exec rm {} ;
echo "delete file over 30 days"