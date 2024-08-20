@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-44: ������ �̿� NTFS �̵�� ���� �� ������ ��� ���� ����
echo ================================================================

:: Query the registry value and write to the file
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" > C:\result\Windows\export\W_44.txt 2>&1

:: Display only the ShutdownWithoutLogon value from the registry query
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AllocateDASD" ^| findstr "AllocateDASD"') do set AllocateDASDValue=%%A
echo AllocateDASD ��: %AllocateDASDValue%

set result=0
if %ERRORLEVEL%==0 (
    set result=1
)

if "%AllocateDASDValue%"=="0" (
    set result=1
)

if %result%==1 (
echo ��ġ: �̵��� �̵�� ���� �� ������ ���: ��ȣ
) else (
echo echo ��ġ: �̵��� �̵�� ���� �� ������ ���: ���
)




echo ================================================================

:: Check the AllocateDASD value
if %result%==1 (
    echo W-44,���� >> C:\result\Windows\result.txt
    echo �� ��� : ��ȣ 
) else (
    echo W-44,�Ҹ��� >> C:\result\Windows\result.txt
    echo �� ��� : ���
)

echo ================================================================
pause