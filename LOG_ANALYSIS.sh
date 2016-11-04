#!/bin/bash
##############################
HOSTNAME=""                       #数据库信息
PORT=""
USERNAME=""
PASSWORD=""
DATABASE="LogAnalysis"                          #数据库名称
TABLENAME="LogAnalysis"                         #数据库中表的名称                                 
######################
#crate database
mysql -u $USER << EOF 2>/dev/null
CREATE DATABASE $DATABASE
EOF
[ $? -eq 0 ] && echo "created DB" || echo DB already exists
######################
#create table
mysql -u $USER $DATABASE << EOF 2>/dev/null
CREATE TABLE $TABLENAME(
version varchar(20),
ANRnum int,
ANRdescription varchar(10000)
CrasNnum int,
CrashDescription varchar(10000)
);
EOF
[ $? -eq 0 ] && echo "Created table LogAnalysis" || echo "Table LogAnalysis already exist"
######################
#do analysis
VERSION="v1.0"
i=0
j=0
lnum=0
touch ANRResult.txt
chmod 777 ANRResult.txt
touch crashResult.txt
chmod 777 crashResult.txt
while read LINE
do
	lnum=$((lnum+1))
if echo $LINE | grep "ANR in"
	then
	i=$((i+1))
	insert_sql="insert into ${TABLENAME} values($VERSION,$lnum,$LINE,null,null)"
	mysql -h${HOSTNAME}  -P${PORT}  -u${USERNAME} -p${PASSWORD} ${DATABASE} -e "${insert_sql}"
	echo $LINE >> ANRResult.txt
elif echo $LINE | grep "am_crash" 
	then
	j=$((j+1))
	insert_sql="insert into ${TABLENAME} values($VERSION,null,null,$lnum,$LINE)"
	mysql -h${HOSTNAME}  -P${PORT}  -u${USERNAME} -p${PASSWORD} ${DATABASE} -e "${insert_sql}"
	echo $LINE >> crashResult.txt
fi
done < monkeyt.txt
select_sql="select * FROM $TABLENAME"
mysql -h${HOSTNAME}  -P${PORT}  -u${USERNAME} -p${PASSWORD} ${DATABASE} -e "${select_sql}"
echo "ANR counts is" $i
echo "crash counts is" $j
echo "the logfile has %d lines" $lnum
