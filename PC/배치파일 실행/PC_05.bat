@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\PC mkdir C:\result\PC\export

echo ================================================================
echo PC-05: ����� PC���� ��� �޽����� ����ϰ� �ִ����� ����
echo ================================================================

:: Query the registry value and write to the file
reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Messenger\Client" > C:\result\PC\export\PC_05.txt 2>&1

:: Display only the PreventRun value from the registry query
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Messenger\Client" /v "PreventRun" ^| findstr "PreventRun"') do set PreventRunValue=%%A
echo PreventRun ��: %PreventRunValue%

echo ================================================================

:: Check the registry value
reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Messenger\Client" /v "PreventRun" >nul 2>&1
if %errorlevel% neq 0 (
    echo PC-05,�Ҹ��� >> C:\result\PC\result.txt
    echo �� ��� : ���
) else (
    :: If the key exists, check if the value is 1
    reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Messenger\Client" /v "PreventRun" | find "0x1" >nul 2>&1
    if %errorlevel% equ 0 (
        echo PC-05,���� >> C:\result\PC\result.txt
        echo �� ��� : ��ȣ 
    ) else (
        echo PC-05,�Ҹ��� >> C:\result\PC\result.txt
        echo �� ��� : ���
    )
)
echo ================================================================
pause