@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-39: ��α׿� ������� �ý��� ���� ��� ���� ����
echo ================================================================

:: Query the registry value and write to the file
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\ShutdownWithoutLogon" > C:\result\Windows\export\W_39.txt 2>&1

:: Display only the ShutdownWithoutLogon value from the registry query
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ShutdownWithoutLogon" ^| findstr "ShutdownWithoutLogon"') do set ShutdownWithoutLogonValue=%%A
echo ShutdownWithoutLogon ��: %ShutdownWithoutLogonValue%

set result=���

if "%ShutdownWithoutLogonValue%"=="0x0" (
set result=��� ����
)

echo �ý��� ����: �α׿����� �ʰ� �ý��� ���� ���: %result% 

echo ================================================================

:: Check the ShutdownWithoutLogon value
if "%ShutdownWithoutLogonValue%"=="0x0" (
    echo W-39,���� >> C:\result\Windows\result.txt
    echo �� ��� : ��ȣ 
) else (
    echo W-39,�Ҹ��� >> C:\result\Windows\result.txt
    echo �� ��� : ���
)

echo ================================================================
pause