@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-46: Everyone ��� ������ �͸� ����ڿ� ���� ��å�� ���� ���� ����
echo ================================================================

:: Query the registry value and write to the file
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" > C:\result\Windows\export\W_46.txt 2>&1

:: Display only the ShutdownWithoutLogon value from the registry query
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v "everyoneincludesanonymous" ^| findstr "everyoneincludesanonymous"') do set everyoneincludesanonymousValue=%%A
echo everyoneincludesanonymous ��: %everyoneincludesanonymousValue%

set result=���

if "%everyoneincludesanonymousValue%"=="0x0" (
set result=��� ����
)

echo ��Ʈ��ũ �׼���: Everyone ��� ������ �͸� ����ڿ��� ����: %result%

echo ================================================================

:: Check the everyoneincludesanonymous value
if "%everyoneincludesanonymousValue%"=="0x0" (
    echo W-46,���� >> C:\result\Windows\result.txt
    echo �� ��� : ��ȣ 
) else (
    echo W-46,�Ҹ��� >> C:\result\Windows\result.txt
    echo �� ��� : ���
)

echo ================================================================
pause