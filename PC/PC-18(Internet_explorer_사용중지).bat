@echo off

echo ================================================================
echo PC-17: ������ ���ͳ� �ɼǿ� �ִ� ��� ������ ���������� ���� �� �ӽ� ���ͳ� ���� ���� ���⡱ ����� Ȱ��ȭ �Ǿ� �ִ��� ����
echo ================================================================

REM Query the registry value and write to the file
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\InternetSettings\Cache" >> C:\result\PC\export\PC_18.txt 2>&1

REM Check the registry value
reg query "SOFTWARE\Microsoft\Windows\CurrentVersion\InternetSettings\Cache" /v "Persistent" >nul 2>&1
if %errorlevel% neq 0 (
    echo PC-18,�Ҹ��� >> C:\result\PC\result.txt
    echo �� ��� : ���
) else (
    :: If the key exists, check if the value is 1
    reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\InternetSettings\Cache" /v "Persistentl" | find "0x0" >nul 2>&1
    if %errorlevel% equ 0 (
		echo PC-18,���� >> C:\result\PC\result.txt
		echo �� ��� : ��ȣ
    ) else (
		echo PC-18,�Ҹ��� >> C:\result\PC\result.txt
		echo �� ��� : ���
    )
)
echo =====================================
pause