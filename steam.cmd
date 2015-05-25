@ECHO OFF

::==============================::
::  SteamCMD Auto Updater 1.6   ::
::           Credits            ::
::           C0nw0nk            ::
::==============================::
:: https://github.com/C0nw0nk/SteamCMD-AutoUpdate-Any-Gameserver ::

:: This is the SteamDEV api key required for automatic updates ::
:: If you do not have one you may obtain your API key from here = http://steamcommunity.com/dev/apikey ::
set steamkey=

:: This is the required login for SteamCMD to download updates ::
:: example = login=C0nw0nk Password ::
:: For most game servers you do not require this and can leave it as anonymous ::
:: Certain game servers you have to use a username and password to install them ::
set login=anonymous

:: This is the directory you wish to install and keep your server updated to ::
set install_directory=C:\game-servers\CSGO

:: This is for the directory where you installed steamcmd ::
:: http://media.steampowered.com/installer/steamcmd.zip ::
set steamcmd_path=C:\steamcmd\steamcmd.exe

:: This is the path to the exe of the game server this allows us to close and run the server for and after a update ::
:: Other command line variables for srcds can be found here https://developer.valvesoftware.com/wiki/Command_Line_Options ::
:: Example ::
:: set exe_path=C:\game-servers\CSGO\srcds.exe -game csgo -console -nocrashdialog -port 27015 +clientport 27005 +game_type 0 +game_mode 0 +mapgroup mg_active +map de_dust2 ::
set exe_path=

:: This is the title of your server this will help you know what server this auto updater is running for ::
set servername=My CSGO#1 Server

:: This is the app ID of the game server you are installing / running ::
set appid=740

:: This is the app ID the url will check for updates on that game ::
:: Some games this is the same as the installation appid other games it is a different numeric value ::
:: if your latest-version.txt file is empty you need to make this value different to the installation appid, just go to the steam store page and get the appid from the end url ::
set update_appid=730

:: Automatic Updating Interval (in seconds) this will set how often you check the steam servers for a new update ::
:: I recommend 5-10 mins maximum ::
:: Default value 60 seconds 1 minute ::
set interval=60

:: Suppress application error messages, Usualy when your game server crashes you get flagged the following error ::
:: "srcds.exe has stopped working. Windows can check online for a solution to the problem" ::
:: and even after disabling error reporting and the message above you will get the following message instead ::
:: "srcds.exe has stopped working. A problem caused the program to stop working correctly. Please close the program" ::
:: With the following setting the script will prevent all these errors and get your server back online as soon as a crash occurs ::
:: set to false to disable this feature ::
:: Use -nocrashdialog in exe_path to also help suppress server crashes ::
set suppress_errors=true

:: CURL Directory you may define the installation path of CURL if you moved the executables to another directory ::
:: Example ::
:: set curl_dir=C:\path\curl

:: CURL 32bit executable name ::
:: Downloaded from http://curl.haxx.se/download.html#Win32 ::
set curl32bit=curl-32bit.exe
:: CURL 64bit executable name ::
:: Downloaded from http://curl.haxx.se/download.html#Win64 ::
set curl64bit=curl-64bit.exe

:: Don't edit anything past this point ::

:: I AM SERIOUS DO NOT TOUCH ::

:: DON'T MAKE ME HURT YOU! ::

:: il fite u ::

:: Do you realy want some! ::

:: Come on don't be a skrub! ::

:: Sorry did not mean anything I just said go ahead and edit below this point see if I care (seriously just don't touch anything below this)::

:: for the fact you have even scrolled down this far shows your persistence ::

title %servername%  SteamCMD Auto Updater V1.6

rem set window and text color
color 8a

if %PROCESSOR_ARCHITECTURE%==x86 (
rem echo OS is 32bit
set curl=%curl_dir%%curl32bit%
) else (
rem echo OS is 64bit
set curl=%curl_dir%%curl64bit%
)

if "%suppress_errors%"=="false" (
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Windows" /v ErrorMode /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\Windows Error Reporting" /v DontShowUI /t REG_DWORD /d 0 /f >nul 2>&1
) else (
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Windows" /v ErrorMode /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\Windows Error Reporting" /v DontShowUI /t REG_DWORD /d 1 /f >nul 2>&1
)

FOR /f %%i IN ("%install_directory%") DO (
set filedrive=%%~di
set filepath=%%~pi
set filename=%%~ni
set fileextension=%%~xi
)
if exist %filedrive%%filepath%%filename% (
echo file path exist >nul
) else (
echo create install_directory since it does not exist
mkdir %filedrive%%filepath%%filename%
)

FOR /f %%i IN ("%steamcmd_path%") DO (
set filedrive=%%~di
set filepath=%%~pi
set filename=%%~ni
set fileextension=%%~xi
)
set downloadurl=http://media.steampowered.com/installer/steamcmd.zip
set downloadpath=%filedrive%%filepath%steamcmd.zip
if exist %filedrive%%filepath%%filename%%fileextension% (
echo file path exist >nul
) else (
echo create steamcmd_path since it does not exist
mkdir %filedrive%%filepath%
echo open powershell download steamcmd close powershell open command prompt and run this script again
%WINDIR%\System32\WindowsPowerShell\v1.0\powershell.exe -Command "& {Import-Module BitsTransfer;Start-BitsTransfer '%downloadurl%' '%downloadpath%';$shell = new-object -com shell.application;$zip = $shell.NameSpace('%downloadpath%');foreach($item in $zip.items()){$shell.Namespace('%filedrive%%filepath%').copyhere($item);};remove-item '%downloadpath%';%WINDIR%\System32\cmd.exe /c call '%~dpnx0';}"
pause
)

FOR /f %%i IN ("%curl%") DO (
set filedrive=%%~di
set filepath=%%~pi
set filename=%%~ni
set fileextension=%%~xi
)
set downloadurl=https://www.dropbox.com/s/olhokot9tpalm0p/curl.zip?dl=1
set downloadpath=%filedrive%%filepath%curl.zip
if exist %curl% (
echo file path exist >nul
) else (
echo curl is missing so download and make directory if needed
mkdir %filedrive%%filepath%
echo open powershell download curl close powershell open command prompt and run this script again
%WINDIR%\System32\WindowsPowerShell\v1.0\powershell.exe -Command "& {Import-Module BitsTransfer;Start-BitsTransfer '%downloadurl%' '%downloadpath%';$shell = new-object -com shell.application;$zip = $shell.NameSpace('%downloadpath%');foreach($item in $zip.items()){$shell.Namespace('%filedrive%%filepath%').copyhere($item);};remove-item '%downloadpath%';%WINDIR%\System32\cmd.exe /c call '%~dpnx0';}"
pause
)

goto error

:loop
rem curl call to get the latest game server version from the steam servers
%curl% -o %~n0-latest-version.txt ""http://api.steampowered.com/ISteamUserStats/GetSchemaForGame/v2/?key=%steamkey%^&appid=%update_appid%^&format=json""
if exist %~n0-current-version.txt (
rem echo file exist so do nothing and perform file check to compare existing files
echo "" >nul
) else (
rem echo file doesn't exist so create it and update / install the game server to the latest version
COPY %~n0-latest-version.txt %~n0-current-version.txt
goto error
)
rem file check compare the latest game server version with the current and if they match or miss match
fc %~n0-latest-version.txt %~n0-current-version.txt >nul
if errorlevel 1 goto shutdown_server
:next
rem echo file version match with currently installed so do nothing and attempt to start the server if not already running
rem get the running game server process id from our pid file
set /p texte=< %~n0-pid.txt
rem echo %texte%
rem use the process id and check if it is running or not
setlocal enableDelayedExpansion
rem find process id of game server that should be running and if status is not responding or unknown it means the server has crashed
set "cmd2=tasklist.exe /fi "pid eq %texte%" /fi "status ne running""
for /F "delims=*" %%p in ('!cmd2! ^| findstr "%texte%" ') do (
rem echo pid running but frozen or not responding so terminate
taskkill /PID %texte%
goto next
)
rem check process id to see if running and active
set "cmd=tasklist.exe /FI "pid eq %texte%""
for /F "delims=*" %%p in ('!cmd! ^| findstr "%texte%" ') do (
rem echo pid running and found %%p
timeout /t %interval% /NOBREAK
goto loop
)
rem echo pid not found pause so start running the game server and get game server pid
rem process id in pid file not found or running so lets start the game server to get it running and store the game server pid in the file
for /f "tokens=2 delims==; " %%a in (' wmic process call create "%exe_path%" ^| find "ProcessId" ') do set PID=%%a
echo %PID% > %~n0-pid.txt
timeout /t %interval% /NOBREAK
goto loop
pause
:error
rem echo failed check so execute steamcmd to update / install the server
rem First we have to kill the running game server pid in order to update it
rem get the running game server process id from our pid file
set /p texte=< %~n0-pid.txt
rem echo %texte%
rem use the process id and check if it is running or not
setlocal enableDelayedExpansion
set "cmd=tasklist.exe /FI "pid eq %texte%""
for /F "delims=*" %%p in ('!cmd! ^| findstr "%texte%" ') do (
rem echo pid of game server running and found so kill / end the process %%p
taskkill /PID %texte%
)
rem execute updater and then close when updates installed and validated
%steamcmd_path% +login %login% +force_install_dir %install_directory% +app_update %appid% validate +quit
rem when update complete go back to the start and check for updates on a regular basis again and launch the updated game server
rem we cant forget to set the current version to the latest installed version
COPY %~n0-latest-version.txt %~n0-current-version.txt >nul
goto loop
pause
:shutdown_server
set /p texte=< %~n0-pid.txt
setlocal enableDelayedExpansion
set "cmd=tasklist.exe /FI "pid eq %texte%""
for /F "delims=*" %%p in ('!cmd! ^| findstr "%texte%" ') do (goto :console_vbs1)
:console_vbs1
echo Option Explicit >%~n0-temp.vbs
echo Dim Shell, WMI, wql, process >>%~n0-temp.vbs
echo Set Shell = CreateObject("WScript.Shell") >>%~n0-temp.vbs
echo Set WMI = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2") >>%~n0-temp.vbs
echo wql = "SELECT ProcessId FROM Win32_Process WHERE ProcessId = %texte%" >>%~n0-temp.vbs
echo For Each process In WMI.ExecQuery(wql) >>%~n0-temp.vbs
echo Shell.AppActivate process.ProcessId >>%~n0-temp.vbs
echo Shell.SendKeys "say Server will shut down in 60 seconds for updates!" >>%~n0-temp.vbs
echo Shell.SendKeys "{ENTER}" >>%~n0-temp.vbs
echo Next >>%~n0-temp.vbs
cscript //nologo %~n0-temp.vbs & del %~n0-temp.vbs
timeout /t 30 /NOBREAK
goto :console_vbs2
:console_vbs2
echo Option Explicit >%~n0-temp.vbs
echo Dim Shell, WMI, wql, process >>%~n0-temp.vbs
echo Set Shell = CreateObject("WScript.Shell") >>%~n0-temp.vbs
echo Set WMI = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2") >>%~n0-temp.vbs
echo wql = "SELECT ProcessId FROM Win32_Process WHERE ProcessId = %texte%" >>%~n0-temp.vbs
echo For Each process In WMI.ExecQuery(wql) >>%~n0-temp.vbs
echo Shell.AppActivate process.ProcessId >>%~n0-temp.vbs
echo Shell.SendKeys "say Server will shut down in 30 seconds for updates!" >>%~n0-temp.vbs
echo Shell.SendKeys "{ENTER}" >>%~n0-temp.vbs
echo Next >>%~n0-temp.vbs
cscript //nologo %~n0-temp.vbs & del %~n0-temp.vbs
timeout /t 20 /NOBREAK
goto :console_vbs3
:console_vbs3
echo Option Explicit >%~n0-temp.vbs
echo Dim Shell, WMI, wql, process >>%~n0-temp.vbs
echo Set Shell = CreateObject("WScript.Shell") >>%~n0-temp.vbs
echo Set WMI = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2") >>%~n0-temp.vbs
echo wql = "SELECT ProcessId FROM Win32_Process WHERE ProcessId = %texte%" >>%~n0-temp.vbs
echo For Each process In WMI.ExecQuery(wql) >>%~n0-temp.vbs
echo Shell.AppActivate process.ProcessId >>%~n0-temp.vbs
echo Shell.SendKeys "say Server will shut down in 10 seconds for updates!" >>%~n0-temp.vbs
echo Shell.SendKeys "{ENTER}" >>%~n0-temp.vbs
echo Next >>%~n0-temp.vbs
cscript //nologo %~n0-temp.vbs & del %~n0-temp.vbs
timeout /t 1 /NOBREAK
goto :console_vbs4
:console_vbs4
echo Option Explicit >%~n0-temp.vbs
echo Dim Shell, WMI, wql, process >>%~n0-temp.vbs
echo Set Shell = CreateObject("WScript.Shell") >>%~n0-temp.vbs
echo Set WMI = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2") >>%~n0-temp.vbs
echo wql = "SELECT ProcessId FROM Win32_Process WHERE ProcessId = %texte%" >>%~n0-temp.vbs
echo For Each process In WMI.ExecQuery(wql) >>%~n0-temp.vbs
echo Shell.AppActivate process.ProcessId >>%~n0-temp.vbs
echo Shell.SendKeys "say Server will shut down in 9 seconds for updates!" >>%~n0-temp.vbs
echo Shell.SendKeys "{ENTER}" >>%~n0-temp.vbs
echo Next >>%~n0-temp.vbs
cscript //nologo %~n0-temp.vbs & del %~n0-temp.vbs
timeout /t 1 /NOBREAK
goto :console_vbs5
:console_vbs5
echo Option Explicit >%~n0-temp.vbs
echo Dim Shell, WMI, wql, process >>%~n0-temp.vbs
echo Set Shell = CreateObject("WScript.Shell") >>%~n0-temp.vbs
echo Set WMI = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2") >>%~n0-temp.vbs
echo wql = "SELECT ProcessId FROM Win32_Process WHERE ProcessId = %texte%" >>%~n0-temp.vbs
echo For Each process In WMI.ExecQuery(wql) >>%~n0-temp.vbs
echo Shell.AppActivate process.ProcessId >>%~n0-temp.vbs
echo Shell.SendKeys "say Server will shut down in 8 seconds for updates!" >>%~n0-temp.vbs
echo Shell.SendKeys "{ENTER}" >>%~n0-temp.vbs
echo Next >>%~n0-temp.vbs
cscript //nologo %~n0-temp.vbs & del %~n0-temp.vbs
timeout /t 1 /NOBREAK
goto :console_vbs6
:console_vbs6
echo Option Explicit >%~n0-temp.vbs
echo Dim Shell, WMI, wql, process >>%~n0-temp.vbs
echo Set Shell = CreateObject("WScript.Shell") >>%~n0-temp.vbs
echo Set WMI = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2") >>%~n0-temp.vbs
echo wql = "SELECT ProcessId FROM Win32_Process WHERE ProcessId = %texte%" >>%~n0-temp.vbs
echo For Each process In WMI.ExecQuery(wql) >>%~n0-temp.vbs
echo Shell.AppActivate process.ProcessId >>%~n0-temp.vbs
echo Shell.SendKeys "say Server will shut down in 7 seconds for updates!" >>%~n0-temp.vbs
echo Shell.SendKeys "{ENTER}" >>%~n0-temp.vbs
echo Next >>%~n0-temp.vbs
cscript //nologo %~n0-temp.vbs & del %~n0-temp.vbs
timeout /t 1 /NOBREAK
goto :console_vbs7
:console_vbs7
echo Option Explicit >%~n0-temp.vbs
echo Dim Shell, WMI, wql, process >>%~n0-temp.vbs
echo Set Shell = CreateObject("WScript.Shell") >>%~n0-temp.vbs
echo Set WMI = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2") >>%~n0-temp.vbs
echo wql = "SELECT ProcessId FROM Win32_Process WHERE ProcessId = %texte%" >>%~n0-temp.vbs
echo For Each process In WMI.ExecQuery(wql) >>%~n0-temp.vbs
echo Shell.AppActivate process.ProcessId >>%~n0-temp.vbs
echo Shell.SendKeys "say Server will shut down in 6 seconds for updates!" >>%~n0-temp.vbs
echo Shell.SendKeys "{ENTER}" >>%~n0-temp.vbs
echo Next >>%~n0-temp.vbs
cscript //nologo %~n0-temp.vbs & del %~n0-temp.vbs
timeout /t 1 /NOBREAK
goto :console_vbs8
:console_vbs8
echo Option Explicit >%~n0-temp.vbs
echo Dim Shell, WMI, wql, process >>%~n0-temp.vbs
echo Set Shell = CreateObject("WScript.Shell") >>%~n0-temp.vbs
echo Set WMI = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2") >>%~n0-temp.vbs
echo wql = "SELECT ProcessId FROM Win32_Process WHERE ProcessId = %texte%" >>%~n0-temp.vbs
echo For Each process In WMI.ExecQuery(wql) >>%~n0-temp.vbs
echo Shell.AppActivate process.ProcessId >>%~n0-temp.vbs
echo Shell.SendKeys "say Server will shut down in 5 seconds for updates!" >>%~n0-temp.vbs
echo Shell.SendKeys "{ENTER}" >>%~n0-temp.vbs
echo Next >>%~n0-temp.vbs
cscript //nologo %~n0-temp.vbs & del %~n0-temp.vbs
timeout /t 1 /NOBREAK
goto :console_vbs9
:console_vbs9
echo Option Explicit >%~n0-temp.vbs
echo Dim Shell, WMI, wql, process >>%~n0-temp.vbs
echo Set Shell = CreateObject("WScript.Shell") >>%~n0-temp.vbs
echo Set WMI = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2") >>%~n0-temp.vbs
echo wql = "SELECT ProcessId FROM Win32_Process WHERE ProcessId = %texte%" >>%~n0-temp.vbs
echo For Each process In WMI.ExecQuery(wql) >>%~n0-temp.vbs
echo Shell.AppActivate process.ProcessId >>%~n0-temp.vbs
echo Shell.SendKeys "say Server will shut down in 4 seconds for updates!" >>%~n0-temp.vbs
echo Shell.SendKeys "{ENTER}" >>%~n0-temp.vbs
echo Next >>%~n0-temp.vbs
cscript //nologo %~n0-temp.vbs & del %~n0-temp.vbs
timeout /t 1 /NOBREAK
goto :console_vbs10
:console_vbs10
echo Option Explicit >%~n0-temp.vbs
echo Dim Shell, WMI, wql, process >>%~n0-temp.vbs
echo Set Shell = CreateObject("WScript.Shell") >>%~n0-temp.vbs
echo Set WMI = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2") >>%~n0-temp.vbs
echo wql = "SELECT ProcessId FROM Win32_Process WHERE ProcessId = %texte%" >>%~n0-temp.vbs
echo For Each process In WMI.ExecQuery(wql) >>%~n0-temp.vbs
echo Shell.AppActivate process.ProcessId >>%~n0-temp.vbs
echo Shell.SendKeys "say Server will shut down in 3 seconds for updates!" >>%~n0-temp.vbs
echo Shell.SendKeys "{ENTER}" >>%~n0-temp.vbs
echo Next >>%~n0-temp.vbs
cscript //nologo %~n0-temp.vbs & del %~n0-temp.vbs
timeout /t 1 /NOBREAK
goto :console_vbs11
:console_vbs11
echo Option Explicit >%~n0-temp.vbs
echo Dim Shell, WMI, wql, process >>%~n0-temp.vbs
echo Set Shell = CreateObject("WScript.Shell") >>%~n0-temp.vbs
echo Set WMI = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2") >>%~n0-temp.vbs
echo wql = "SELECT ProcessId FROM Win32_Process WHERE ProcessId = %texte%" >>%~n0-temp.vbs
echo For Each process In WMI.ExecQuery(wql) >>%~n0-temp.vbs
echo Shell.AppActivate process.ProcessId >>%~n0-temp.vbs
echo Shell.SendKeys "say Server will shut down in 2 seconds for updates!" >>%~n0-temp.vbs
echo Shell.SendKeys "{ENTER}" >>%~n0-temp.vbs
echo Next >>%~n0-temp.vbs
cscript //nologo %~n0-temp.vbs & del %~n0-temp.vbs
timeout /t 1 /NOBREAK
goto :console_vbs12
:console_vbs12
echo Option Explicit >%~n0-temp.vbs
echo Dim Shell, WMI, wql, process >>%~n0-temp.vbs
echo Set Shell = CreateObject("WScript.Shell") >>%~n0-temp.vbs
echo Set WMI = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2") >>%~n0-temp.vbs
echo wql = "SELECT ProcessId FROM Win32_Process WHERE ProcessId = %texte%" >>%~n0-temp.vbs
echo For Each process In WMI.ExecQuery(wql) >>%~n0-temp.vbs
echo Shell.AppActivate process.ProcessId >>%~n0-temp.vbs
echo Shell.SendKeys "say Server will shut down in 1 second for updates!" >>%~n0-temp.vbs
echo Shell.SendKeys "{ENTER}" >>%~n0-temp.vbs
echo Next >>%~n0-temp.vbs
cscript //nologo %~n0-temp.vbs & del %~n0-temp.vbs
timeout /t 1 /NOBREAK
goto :console_vbs13
:console_vbs13
echo Option Explicit >%~n0-temp.vbs
echo Dim Shell, WMI, wql, process >>%~n0-temp.vbs
echo Set Shell = CreateObject("WScript.Shell") >>%~n0-temp.vbs
echo Set WMI = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2") >>%~n0-temp.vbs
echo wql = "SELECT ProcessId FROM Win32_Process WHERE ProcessId = %texte%" >>%~n0-temp.vbs
echo For Each process In WMI.ExecQuery(wql) >>%~n0-temp.vbs
echo Shell.AppActivate process.ProcessId >>%~n0-temp.vbs
echo Shell.SendKeys "say Server is shutting down to install updates, Goodbye!" >>%~n0-temp.vbs
echo Shell.SendKeys "{ENTER}" >>%~n0-temp.vbs
echo Next >>%~n0-temp.vbs
cscript //nologo %~n0-temp.vbs & del %~n0-temp.vbs
goto :error
pause
