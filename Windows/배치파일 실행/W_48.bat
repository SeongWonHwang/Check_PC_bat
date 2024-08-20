@echo off

:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows
if not exist C:\result\Windows\export mkdir C:\result\Windows\export

echo ================================================================
echo W-48: ���� �н����� ���⼺ ��å ���� ���� ����
echo ================================================================

:: ���� ��å�� inf ���Ϸ� �������ϴ�.
secedit /export /cfg C:\result\Windows\export\export.inf /areas SECURITYPOLICY >nul 2>&1

type C:\result\Windows\export\export.inf > C:\result\Windows\export\export_ansi.inf

echo ================================================================

:: ������ ���Ͽ��� PasswordComplexity ������ Ȯ���մϴ�.
findstr /r /c:"PasswordComplexity = 1" C:\result\Windows\export\export_ansi.inf >nul
if %ERRORLEVEL% equ 0 (
    set PasswordComplexity=1
    echo ��ȣ�� ���⼺�� �����ؾ� ��:                              ���
) else (
    set PasswordComplexity=0
    echo ��ȣ�� ���⼺�� �����ؾ� ��:                          ��� �� ��
)

:: ��� ��
set Result=��ȣ
if %PasswordComplexity% equ 0 (
    set Result=���
)
echo ================================================================

:: ��� ��� �� ����
if "%Result%" equ "��ȣ" (
    echo �� ��� : ��ȣ
    echo W-48,���� >> C:\result\Windows\result.txt
) else (
    echo �� ��� : ���
    echo W-48,�Ҹ��� >> C:\result\Windows\result.txt
)

echo ================================================================

del C:\result\Windows\export\export.inf
del C:\result\Windows\export\export_ansi.inf	

pause