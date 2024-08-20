@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\PC mkdir C:\result\PC\export

:: 기존 결과 파일을 삭제하여 중복 기록 방지
if exist C:\result\PC\export\PC_04.txt del C:\result\PC\export\PC_04.txt

echo ================================================================
echo PC-04: 사용하지 않는 서비스나 디폴트로 설치되어 실행되고 있는 서비스가 있는지 점검
echo ================================================================

net start | find /I "Alerter" >> C:\result\PC\export\PC_04.txt
net start | find /I "Automatic Updates" >> C:\result\PC\export\PC_04.txt
net start | find /I "Clipbook" >> C:\result\PC\export\PC_04.txt
net start | find /I "Computer Browser" >> C:\result\PC\export\PC_04.txt
net start | find /I "Cryptographic Service" >> C:\result\PC\export\PC_04.txt
net start | find /I "DHCP Client" >> C:\result\PC\export\PC_04.txt
net start | find /I "Distributed Link Tracking Client Server" >> C:\result\PC\export\PC_04.txt
net start | find /I "DNS Client" >> C:\result\PC\export\PC_04.txt
net start | find /I "Error reporting Service" >> C:\result\PC\export\PC_04.txt
net start | find /I "Human Interface Device Access" >> C:\result\PC\export\PC_04.txt
net start | find /I "IMAPI CD-Burning COM Service" >> C:\result\PC\export\PC_04.txt
net start | find /I "Infrared Monitor" >> C:\result\PC\export\PC_04.txt
net start | find /I "Messenger" >> C:\result\PC\export\PC_04.txt
net start | find /I "NetMeeting Remote Desktop Sharing Service" >> C:\result\PC\export\PC_04.txt
net start | find /I "Portable Media Serial Number" >> C:\result\PC\export\PC_04.txt
net start | find /I "Print spooler" >> C:\result\PC\export\PC_04.txt
net start | find /I "Remote Registry Service" >> C:\result\PC\export\PC_04.txt
net start | find /I "Routing and Remote Access Service" >> C:\result\PC\export\PC_04.txt
net start | find /I "Simple TCP/IP Service" >> C:\result\PC\export\PC_04.txt
net start | find /I "Universal Plug and Play Device Host" >> C:\result\PC\export\PC_04.txt
net start | find /I "Wireless Zero Configuration" >> C:\result\PC\export\PC_04.txt

type C:\result\PC\export\PC_04.txt
echo ================================================================

for %%A in (C:\result\PC\export\PC_04.txt) do (
    if %%~zA==0 (
        echo PC-04,만족 >> C:\result\PC\result.txt
        echo ※ 결과 : 양호
    ) else (
        echo PC-04,불만족 >> C:\result\PC\result.txt
        echo ※ 결과 : 취약
    )
)
echo ================================================================
pause