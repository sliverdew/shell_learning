@ECHO off  
ECHO wait_for_you_device  
adb wait-for-device  
set ApksPath=D:\ApkSource\rk3319_live_app
FOR %%i IN (*.apk) DO (
    ECHO installing:%%i
    adb install -r "%ApksPath%\%%i" 
    )
ECHO apk_install_finish!
PAUSE  
exit  
@ECHO on