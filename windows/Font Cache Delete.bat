@echo off
setlocal


openfiles >nul 2>&1
if not %errorlevel%==0 (
    powershell start-process '%0' -verb runas
    exit /b
)


set "target_paths=C:\Windows\ServiceProfiles\LocalService\AppData\Local\FontCache C:\Windows\System32\FNTCACHE.DAT"


for %%p in (%target_paths%) do (
    if exist "%%p" (
        rmdir /s /q "%%p" || del /q "%%p"
        echo "%%p has been deleted."
    ) else (
        echo "%%p does not exsist."
    )
)


echo Shutdown after 15sec!!
shutdown /r /t 15 /c "Restart!!!" /f

pause
