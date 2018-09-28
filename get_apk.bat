@echo off
chcp 65001
setlocal enabledelayedexpansion
for %%i in (*.apk) do (
	aapt dump badging %%i | findstr version > a.txt
	aapt dump badging %%i | findstr "application: label=" > b.txt
	for /f "tokens=2 delims='" %%n in (b.txt) do (
		set /a flag+=1 & if !flag!==1 set "APK_NAME=%%n"
	)
	for /f "tokens=6 delims='" %%v in (a.txt) do set APK_VER=%%v
	set APK_TOTAL=!APK_NAME!_!APK_VER!
	echo !APK_TOTAL!
	set flag=0
	ren "%%i" "!APK_TOTAL!.apk"
	)
pause>nul