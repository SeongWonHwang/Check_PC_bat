@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-56: �ܼ� �α��� �� �� ��ȣ ��� ���� ���� ����
echo ================================================================

:: Query the registry value and write to the file
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" > C:\result\Windows\export\W_56.txt 2>&1

:: Display only the ShutdownWithoutLogon value from the registry query
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v "LimitBlankPasswordUse" ^| findstr "LimitBlankPasswordUse"') do set LimitBlankPasswordUseValue=%%A
echo LimitBlankPasswordUse ��: %LimitBlankPasswordUseValue%

set result=���

if "%LimitBlankPasswordUseValue%"=="0x0" (
set result=��� ����
)

echo ����: �ܼ� �α׿� �� ���� �������� �� ��ȣ ��� ����: %result%

echo ================================================================

:: Check the LimitBlankPasswordUse value
if "%LimitBlankPasswordUseValue%"=="0x1" (
    echo W-56,���� >> C:\result\Windows\result.txt
    echo �� ��� : ��ȣ 
) else (
    echo W-56,�Ҹ��� >> C:\result\Windows\result.txt
    echo �� ��� : ���
)

echo ================================================================
pause