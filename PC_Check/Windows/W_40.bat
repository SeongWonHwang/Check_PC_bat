@echo off

:: C:\result ������ �������� ������ ����
if not exist C:\result\Windows mkdir C:\result\Windows
if not exist C:\result\Windows\export mkdir C:\result\Windows\export

echo ================================================================
echo W-40: ���� �ý��� ���� ��å ������ ����
echo ================================================================

secedit /export /cfg C:\result\Windows\export\export.inf >nul 2>&1

type C:\result\Windows\export\export.inf | find /i "SeRemoteShutdownPrivilege"

:: SeRemoteShutdownPrivilege ������ ã�� �� ����.
for /f "tokens=2 delims==" %%a in ('type C:\result\Windows\export\export.inf ^| find /i "SeRemoteShutdownPrivilege"') do (
    set "SeRemoteShutdownPrivilege=%%a"
)

:: ���� ����
set "SeRemoteShutdownPrivilege=%SeRemoteShutdownPrivilege: =%"

:: SeRemoteShutdownPrivilege ���� Ȯ��
echo SeRemoteShutdownPrivilege ������: %SeRemoteShutdownPrivilege%

echo Administrator SID ��: *S-1-5-32-544"
echo ================================================================
if "%SeRemoteShutdownPrivilege%"=="*S-1-5-32-544" (
    echo W-40,���� >> C:\result\Windows\result.txt
    echo �� ��� : ��ȣ 
) else (
    echo W-40,�Ҹ��� >> C:\result\Windows\result.txt
    echo �� ��� : ���
)
echo ================================================================

del C:\result\Windows\export\export.inf

pause