@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\PC mkdir C:\result\PC\export

echo ================================================================
echo PC-13: �̵��� �̵� ���� ���ȴ�å ���� ���� ����
echo ================================================================

REM Query the registry value and write to the file
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" > C:\result\PC\export\PC_13.txt 2>&1

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" ^| findstr "NoDriveTypeAutoRun"') do set NoDriveTypeAutoRunValue=%%A
echo NoDriveTypeAutoRun ��: %NoDriveTypeAutoRunValue%

echo ================================================================

REM Check the registry value
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" >nul 2>&1
if %errorlevel% neq 0 (
    echo PC-13,�Ҹ��� >> C:\result\PC\result.txt
    echo �� ��� : ���
) else (
    :: If the key exists, check if the value is 1
    reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" | find "0xff" >nul 2>&1
    if %errorlevel% equ 0 (
        echo PC-13,���� >> C:\result\PC\result.txt
        echo �� ��� : ��ȣ
    ) else (
        echo PC-13,�Ҹ��� >> C:\result\PC\result.txt
        echo �� ��� : ���
    )
)
echo ================================================================
pause