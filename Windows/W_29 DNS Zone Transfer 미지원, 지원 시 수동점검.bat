@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-29: DNS Zone Transfer ���� ���� ���� ����
echo ================================================================

:: Query the registry value and write to the file
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones\jini" > C:\result\Windows\export\W_29.txt 2>&1

:: Display only the PreventRun value from the registry query
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones\jini" /v "SecureSecondaries" ^| findstr "SecureSecondaries"') do set SecureSecondariesValue=%%A
echo SecureSecondaries ��: %SecureSecondariesValue%

echo ================================================================

:: Check the registry value
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones\jini" /v "SecureSecondaries" >nul 2>&1
if %errorlevel% neq 0 (
    echo W-29,���� >> C:\result\Windows\result.txt
    echo �� ��� : ����
) else (
    :: If the key exists, check if the value is 1
    reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones\jini" /v "SecureSecondaries" | find "0x1" >nul 2>&1
    if %errorlevel% equ 0 (
        echo W-29,���� >> C:\result\Windows\result.txt
        echo �� ��� : ��ȣ 
    ) else (
        echo W-29,�Ҹ��� >> C:\result\Windows\result.txt
        echo �� ��� : ���
    )
)
echo ================================================================
pause