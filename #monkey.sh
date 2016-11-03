#自动monkey
touch anr.txt
chmod 777 anr.txt
touch crashed.txt
chmod 777 crashed.txt
start=$(date "+%s")
logcat -b system -b event -b main -b radio -b crash -v time -f a.alog&
cat /proc/kmsg > k.klog &
monkey --throttle 200 --ignore-crashes --ignore-timeouts --ignore-security-exceptions -v -v 1000 >m.log &
#数据分析
now=$(date "+%s")
time=$((now-start))
echo "time used:$time seconds"
cat a.log | grep "Application is not responding" | awk '{ print $13 "," $0}' $* |sort > anr.txt #按异常package包名排序
cat a.log | grep "am_crash" | awk '{ print $8 "," $0}' $* |sort > crashed.txt #按异常package包名排序
echo m.log | grep "sending event" | tail -n 1 #直接取最后一次结果判断运行次数
