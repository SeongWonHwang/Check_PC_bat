@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\PC mkdir C:\result\PC\export

echo ================================================================
echo PC-15: ������ ���� �ܼ� �ڵ� �α��� ������ ���Ǿ� �ִ��� ����
echo ================================================================

REM Query the registry value and write to the file
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole" > C:\result\PC\export\PC_15.txt 2>&1

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole" /v "SecurityLevel" ^| findstr "SecurityLevel"') do set SecurityLevelValue=%%A
echo SecurityLevel ��: %SecurityLevelValue%

echo ================================================================

REM Check the registry value
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole" /v "SecurityLevel" >nul 2>&1
if %errorlevel% neq 0 (
    echo PC-15,�Ҹ��� >> C:\result\PC\result.txt
    echo �� ��� : ���
) else (
    :: If the key exists, check if the value is 1
    reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole" /v "SecurityLevel" | find "0x0" >nul 2>&1
    if %errorlevel% equ 0 (
		echo PC-15,���� >> C:\result\PC\result.txt
		echo �� ��� : ��ȣ 
    ) else (
		echo PC-15,�Ҹ��� >> C:\result\PC\result.txt
		echo �� ��� : ���
    )
)
echo ================================================================
pause