#自动monkey
logcat -v time -f alog.txt&
cat /proc/kmsg > klog.txt &
monkey --throttle 200 --ignore-crashes --ignore-timeouts --ignore-security-exceptions -v -v 100000000 >m.log &
