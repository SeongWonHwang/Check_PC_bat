@echo off

:: C:\result ������ �������� ������ ����
if not exist C:\result\Windows mkdir C:\result\Windows
if not exist C:\result\Windows\export mkdir C:\result\Windows\export

echo ================================================================
echo W-42: SAM ������ ������ �͸� ���� ��� �� �ԡ� ��å ���� ���� ����
echo ================================================================

reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" > C:\result\Windows\export\W_42.txt 2>&1

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v "RestrictAnonymous" ^| findstr "RestrictAnonymous"') do set RestrictAnonymousValue=%%A

for /f "tokens=3" %%B in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v "RestrictAnonymousSAM" ^| findstr "RestrictAnonymousSAM"') do set RestrictAnonymousSAMValue=%%B

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

set "Result=��ȣ"

if "%RestrictAnonymousValue%"=="0x0" (
    set "Result=��ȣ"
)

if "%RestrictAnonymousSAMValue%"=="0x0" (
    set "Result=���"
)

:: ��� �� �� ����
if "%Result%"=="���" (
    echo W-42,�Ҹ��� >> C:\result\Windows\result.txt
    echo �� ��� : ���
) else (
    echo W-42,���� >> C:\result\Windows\result.txt
    echo �� ��� : ��ȣ
)

echo ================================================================
pause