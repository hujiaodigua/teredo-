@echo off

cd /d "%~dp0"
cacls.exe "%SystemDrive%\System Volume Information" >nul 2>nul
if %errorlevel%==0 goto Admin
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
echo Set RequestUAC = CreateObject^("Shell.Application"^)>"%temp%\getadmin.vbs"
echo RequestUAC.ShellExecute "%~s0","","","runas",1 >>"%temp%\getadmin.vbs"
echo WScript.Quit >>"%temp%\getadmin.vbs"
"%temp%\getadmin.vbs" /f
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
exit

:Admin


:begin
Echo. 请选择需要的操作
Echo     1 netsh int ipv6 show teredo
Echo     2 自动选择并设置teredo服务器
Echo     3 手动选择并设置teredo服务器
Echo     4 exit
Set /P Choice= 　　　　　请选择要进行的操作数字 ，然后按回车：
If not "%Choice%"=="" (
  If "%Choice%"=="4" goto exit
  If "%Choice%"=="1" goto one
  If "%Choice%"=="2" goto two
  If "%Choice%"=="3" goto :begin2
)

:one
 netsh int ipv6 show teredo
goto begin
:two
"%~dp0code"\default\python27\1.0\python.exe "%~dp0teredo.py"
goto begin

:begin2
Echo. 请选择需要的操作
echo     1 	teredo.remlab.net
echo     2 	teredo2.remlab.net
echo     3 	teredo-debian.remlab.net
echo     4 	teredo.ngix.ne.kr
echo     5 	teredo.trex.fi
echo     6 	teredo.autotrans.consulintel.com
echo     7 	teredo.managemydedi.com
echo     8 	teredo.ipv6.microsoft.com
echo     9 	win10.ipv6.microsoft.com
echo     10	teredo.iks-jena.de',
echo     11	win1710.ipv6.microsoft.com
echo     0 	返回
Set /P Choice= 　　　　　请选择要进行的操作数字 ，然后按回车：
If not "%Choice%"=="" (
	If "%Choice%"=="0" goto begin
	If "%Choice%"=="11" goto two11
	If "%Choice%"=="10" goto two10
	If "%Choice%"=="9" goto two9
	If "%Choice%"=="8" goto two8
	If "%Choice%"=="7" goto two7
	If "%Choice%"=="6" goto two6
	If "%Choice%"=="5" goto two5
	If "%Choice%"=="4" goto two4
	If "%Choice%"=="3" goto two3
	If "%Choice%"=="2" goto two2
	If "%Choice%"=="1" goto two1

)
:two1
netsh interface teredo set state server=teredo.remlab.net
goto begin
:two2
netsh interface teredo set state server=teredo2.remlab.net
goto begin
:two3
netsh interface teredo set state server=teredo-debian.remlab.net
goto begin
:two4
netsh interface teredo set state server=teredo.ngix.ne.kr
goto begin
:two5
netsh interface teredo set state server=teredo.trex.fi
goto begin
:two6
netsh interface teredo set state server=teredo.autotrans.consulintel.com
goto begin
:two7
netsh interface teredo set state server=teredo.managemydedi.com
goto begin
:two8
netsh interface teredo set state server=teredo.ipv6.microsoft.com
goto begin
:two9
netsh interface teredo set state server=win10.ipv6.microsoft.com
goto begin
:two10
netsh interface teredo set state server=teredo.iks-jena.degoto begin
:two11
netsh interface teredo set state server=win1710.ipv6.microsoft.com
goto begin







:exit
exit