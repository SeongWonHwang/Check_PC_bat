@echo off
:: C:\result ������ �������� ������ ����
if not exist C:\result\PC mkdir C:\result\PC\export

echo ================================================================
echo PC-13: �̵��� �̵� ���� ���ȴ�å ���� ���� ����
echo ================================================================

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" > C:\result\PC\export\PC_13.txt 2>&1

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" 2^>nul ^| findstr "NoDriveTypeAutoRun"') do set NoDriveTypeAutoRunValue=%%A

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" >nul 2>&1
if %errorlevel% neq 0 (
    echo PC-13,�Ҹ��� >> C:\result\PC\result.txt
	echo �ڵ� ���� ����: �������� ����
	echo ================================================================
    echo �� ��� : ���
) else (
    reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" | find "0xff" >nul 2>&1
    if %errorlevel% equ 0 (
        echo PC-13,���� >> C:\result\PC\result.txt
		echo �ڵ� ���� ����: ���
		echo ================================================================
        echo �� ��� : ��ȣ
    ) else (
		echo PC-13,�Ҹ��� >> C:\result\PC\result.txt
		echo �ڵ� ���� ����: ��� ����
	echo ================================================================
        echo �� ��� : ���
    )
)
echo ================================================================
pause