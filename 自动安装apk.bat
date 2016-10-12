@ECHO off  
@REM 无限循环的标签  
@REM:LOOP  
ECHO wait_for_you_device  
adb wait-for-device  
@REM 循环安装本目录下的APK文件  
FOR %%i IN (*.apk) DO (   
    ECHO installing:%%i
    adb install "%%i"  
    )  
ECHO apk_install_finish!
PAUSE  
@REM GOTO LOOP
exit  
@ECHO on