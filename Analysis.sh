#数据分析
now=$(date "+%s")
time=$((now-start))
echo "time used:$time seconds"
cat a.log | grep "Application is not responding" | awk '{ print $13 "," $0}' $* |sort > anr.txt #按异常package包名排序
cat a.log | grep "am_crash" | awk '{ print $8 "," $0}' $* |sort > crashed.txt #按异常package包名排序
echo m.log | grep "sending event" | tail -n 1 #直接取最后一次结果判断运行次数
