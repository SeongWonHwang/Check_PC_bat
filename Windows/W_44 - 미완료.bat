@echo off

:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows
if not exist C:\result\Windows\export mkdir C:\result\Windows\export

echo ================================================================
echo W-40: ���� �ý��� ���� ��å ������ ����
echo ================================================================

:: ���� ��å�� inf ���Ϸ� �������ϴ�.
secedit /export /cfg C:\result\Windows\export\export.inf >nul 2>&1

:: SeRemoteShutdownPrivilege ������ ã���ϴ�.
set "PrivilegeCheck=0"
set "ExpectedValue=S-1-5-32-544"

for /f "tokens=*" %%i in (C:\result\Windows\export\export.inf) do (
    echo %%i | findstr /c:"SeRemoteShutdownPrivilege = " >nul
    if %ERRORLEVEL% equ 0 (
        echo %%i | findstr /c:"%ExpectedValue%" >nul
        if %ERRORLEVEL% equ 0 (
            set "PrivilegeCheck=1"
            goto CheckDone
        )
    )
)

:CheckDone
echo ================================================================

:: ������� ���� ���� �� ���
echo PrivilegeCheck = %PrivilegeCheck%

:: ��� �� �� ����
if "%PrivilegeCheck%" equ "1" (
    set "Result=��ȣ"
    echo �� ��� : ��ȣ
    echo W-40,���� >> C:\result\Windows\result.txt
) else (
    set "Result=���"
    echo �� ��� : ���
    echo W-40,�Ҹ��� >> C:\result\Windows\result.txt
)

pause