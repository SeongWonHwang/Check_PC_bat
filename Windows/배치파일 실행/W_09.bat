@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

:: ���� ��� ������ �����Ͽ� �ߺ� ��� ����
if exist C:\result\Windows\export\W_09.txt del C:\result\Windows\export\W_09.txt

echo ================================================================
echo W-09: ���ʿ��� ���� ���� ���� ����
echo ================================================================

:: ���� ���� ���� �� ��� ���
net start | find /I "Alerter" >> C:\result\Windows\export\W_09.txt
net start | find /I "Automatic Updates" >> C:\result\Windows\export\W_09.txt
net start | find /I "Clipbook" >> C:\result\Windows\export\W_09.txt
net start | find /I "Computer Browser" >> C:\result\Windows\export\W_09.txt
net start | find /I "Cryptographic Service" >> C:\result\Windows\export\W_09.txt
net start | find /I "DHCP Client" >> C:\result\Windows\export\W_09.txt
net start | find /I "Distributed Link Tracking Client Server" >> C:\result\Windows\export\W_09.txt
net start | find /I "DNS Client" >> C:\result\Windows\export\W_09.txt
net start | find /I "Error reporting Service" >> C:\result\Windows\export\W_09.txt
net start | find /I "Human Interface Device Access" >> C:\result\Windows\export\W_09.txt
net start | find /I "IMAPI CD-Burning COM Service" >> C:\result\Windows\export\W_09.txt
net start | find /I "Infrared Monitor" >> C:\result\Windows\export\W_09.txt
net start | find /I "Messenger" >> C:\result\Windows\export\W_09.txt
net start | find /I "NetMeeting Remote Desktop Sharing Service" >> C:\result\Windows\export\W_09.txt
net start | find /I "Portable Media Serial Number" >> C:\result\Windows\export\W_09.txt
net start | find /I "Print spooler" >> C:\result\Windows\export\W_09.txt
net start | find /I "Remote Registry Service" >> C:\result\Windows\export\W_09.txt
net start | find /I "Routing and Remote Access Service" >> C:\result\Windows\export\W_09.txt
net start | find /I "Simple TCP/IP Service" >> C:\result\Windows\export\W_09.txt
net start | find /I "Universal Plug and Play Device Host" >> C:\result\Windows\export\W_09.txt
net start | find /I "Wireless Zero Configuration" >> C:\result\Windows\export\W_09.txt

type C:\result\Windows\export\W_09.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_09.txt) do (
    if %%~zA==0 (
        echo W-09,���� >> C:\result\Windows\result.txt
        echo �� ��� : ��ȣ
    ) else (
        echo W-09,�Ҹ��� >> C:\result\Windows\result.txt
        echo �� ��� : ���
    )
)
echo ================================================================
pause