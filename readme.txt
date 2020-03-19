evtest使用方法
编译完成后push进设备，修改权限，在目录下./执行
adb push 路径/evtest /userdata
chmod 777 /userdata/evtest
cd /userdata
./evtest /dev/input/event0
evtest运行时，监控event0的事件并打印出log
例如监控触摸屏，点击触摸屏，串口会打印出这次点击的相关log

TouchInput使用方法
编译完成后push进设备，修改权限，在目录下./执行
adb push 路径/TouchInput /userdata
chmod 777 /userdata/TouchInput
cd /userdata
./TouchInput 123 456
123 456即自己所需要点击的坐标地址，TouchInput只点击单次。