@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-52: �α��� ȭ�鿡 ������ �α׿� ����� �̸��� ǥ������ �ʵ��� �����Ǿ����� ���θ� ����
echo ================================================================

:: Query the registry value and write to the file
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" > C:\result\Windows\export\W_39.txt 2>&1

:: Display only the dontdisplaylastusername value from the registry query
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "dontdisplaylastusername" ^| findstr "dontdisplaylastusername"') do set dontdisplaylastusernameValue=%%A
echo dontdisplaylastusername ��: %dontdisplaylastusernameValue%

set result=���
:: Check the dontdisplaylastusername value
if "%dontdisplaylastusernameValue%"=="0x0" (
set result=��� ����
)

echo ��ȭ�� �α׿�: ������ �α��� ����� �̸� ǥ�� �� ��: %result%

echo ================================================================

:: Check the dontdisplaylastusername value
if "%dontdisplaylastusernameValue%"=="0x1" (
    echo W-52,���� >> C:\result\Windows\result.txt
    echo �� ��� : ��ȣ 
) else (
    echo W-52,�Ҹ��� >> C:\result\Windows\result.txt
    echo �� ��� : ���
set result=��� ����
)

echo ================================================================
pause