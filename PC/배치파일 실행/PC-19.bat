@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\PC mkdir C:\result\PC\export

echo ================================================================
echo PC-19: ���� ������ ������� �ʵ��� �����ϰ� �ִ��� ����
echo ================================================================

REM Query the registry value and write to the file
reg query "HKEY_LOCAL_MACHINE\Software\policies\Microsoft\Windows NT\Terminal Services" >> C:\result\PC\export\PC_19.txt 2>&1

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\Software\policies\Microsoft\Windows NT\Terminal Services" /v "fAllowUnsolicited" ^| findstr "fAllowUnsolicited"') do set fAllowUnsolicitedValue=%%A
echo fAllowUnsolicited ��: %fAllowUnsolicitedValue%

echo ================================================================

REM Check the registry value
reg query "HKEY_LOCAL_MACHINE\Software\policies\Microsoft\Windows NT\Terminal Services" /v "fAllowUnsolicited" >nul 2>&1
if %errorlevel% neq 0 (
	echo PC-19,�Ҹ��� >> C:\result\PC\result.txt
	echo �� ��� : ���
) else (
    :: If the key exists, check if the value is 0
    reg query "HKEY_LOCAL_MACHINE\Software\policies\Microsoft\Windows NT\Terminal Services" /v "fAllowUnsolicited" | find "0x0" >nul 2>&1
    if %errorlevel% equ 0 (
		echo PC-19,���� >> C:\result\PC\result.txt
		echo �� ��� : ��ȣ 
    ) else (
		echo PC-19,�Ҹ��� >> C:\result\PC\result.txt
		echo �� ��� : ���
    )
)

echo =====================================
pause