@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-43: Autologon ��� ���� ���� ���� ����
echo ================================================================

:: Query the registry value and write to the file
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" > C:\result\Windows\export\W_41.txt 2>&1

:: Display only the ShutdownWithoutLogon value from the registry query
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoAdminLogon" ^| findstr "AutoAdminLogon"') do set AutoAdminLogonValue=%%A
echo AutoAdminLogon ��: %AutoAdminLogonValue%

echo ================================================================

:: Check the AutoAdminLogon value
if "%AutoAdminLogonValue%"=="0x1" (
    echo W-43,���� >> C:\result\Windows\result.txt
    echo �� ��� : ���
) else (
    echo W-43,�Ҹ��� >> C:\result\Windows\result.txt
    echo �� ��� : ��ȣ
)

echo ================================================================
pause