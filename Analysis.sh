#数据分析
cat alog.txt | grep "Application is not responding" | awk '{ print $13 " " $0}' $* |sort|awk -f ANRan.sh >> result.txt #按异常package包名排序
cat alog.txt | grep "am_crash" | awk '{ print $8 "," $0}' $* |sort| awk -f ANRan.sh >> result.txt #按异常package包名排序
echo m.log | grep "sending event" | tail -n 1 >> result.txt #直接取最后一次结果判断运行次数