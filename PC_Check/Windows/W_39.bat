@echo off
:: C:\result ������ �������� ������ ����
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-39: ��α׿� ������� �ý��� ���� ��� ���� ����
echo ================================================================

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\ShutdownWithoutLogon" > C:\result\Windows\export\W_39.txt 2>&1

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ShutdownWithoutLogon" ^| findstr "ShutdownWithoutLogon"') do set ShutdownWithoutLogonValue=%%A

set result=���

if "%ShutdownWithoutLogonValue%"=="0x0" (
set result=��� ����
)

echo �ý��� ����: �α׿����� �ʰ� �ý��� ���� ���: %result% 

echo ================================================================

if "%ShutdownWithoutLogonValue%"=="0x0" (
    echo W-39,���� >> C:\result\Windows\result.txt
    echo �� ��� : ��ȣ 
) else (
    echo W-39,�Ҹ��� >> C:\result\Windows\result.txt
    echo �� ��� : ���
)

echo ================================================================
pause