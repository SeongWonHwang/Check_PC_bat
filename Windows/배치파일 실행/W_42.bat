@echo off

:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows
if not exist C:\result\Windows\export mkdir C:\result\Windows\export

echo ================================================================
echo W-42: SAM ������ ������ �͸� ���� ��� �� �ԡ� ��å ���� ���� ����
echo ================================================================

:: Query the registry values and write to the file
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" > C:\result\Windows\export\W_41.txt 2>&1

:: Display only the RestrictAnonymous value from the registry query
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v "RestrictAnonymous" ^| findstr "RestrictAnonymous"') do set RestrictAnonymousValue=%%A
echo RestrictAnonymous ��: %RestrictAnonymousValue%

:: Display only the RestrictAnonymousSAM value from the registry query
for /f "tokens=3" %%B in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v "RestrictAnonymousSAM" ^| findstr "RestrictAnonymousSAM"') do set RestrictAnonymousSAMValue=%%B
echo RestrictAnonymousSAM ��: %RestrictAnonymousSAMValue%

set "result_RA=���"
set "result_RAS=���"

if "%RestrictAnonymousValue%"=="0x0" (
    set "result_RA=��� ����"
)

if "%RestrictAnonymousSAMValue%"=="0x0" (
    set "result_RAS=��� ����"
)

echo ��Ʈ��ũ �׼���: SAM ������ ������ �͸� ���� ��� �� ��: %result_RA%
echo ��Ʈ��ũ �׼���: SAM ������ �͸� ���� ��� �� ��: %result_RAS%

echo ================================================================

:: Check both RestrictAnonymous and RestrictAnonymousSAM values
set "Result=��ȣ"

if "%RestrictAnonymousValue%"=="0x0" (
    set "Result=��ȣ"
)

if "%RestrictAnonymousSAMValue%"=="0x0" (
    set "Result=���"
)

:: ��� �� �� ����
if "%Result%"=="���" (
    echo W-41,�Ҹ��� >> C:\result\Windows\result.txt
    echo �� ��� : ���
) else (
    echo W-41,���� >> C:\result\Windows\result.txt
    echo �� ��� : ��ȣ
)

echo ================================================================
pause