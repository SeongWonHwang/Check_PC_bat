@echo off

:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-05: �ص� ������ ��ȣȭ ��� ���� ����
echo ================================================================

:: ���� ��å�� inf ���Ϸ� �������ϴ�.
secedit /export /cfg C:\result\PC\export\export.inf /areas SECURITYPOLICY >nul 2>&1


:: UTF-16 ������ ANSI�� ��ȯ
type C:\result\PC\export\export.inf > C:\result\PC\export\export_ansi.inf

:: ������ ���Ͽ��� PasswordComplexity ������ Ȯ���մϴ�.
findstr /r /c:"ClearTextPassword = 1" C:\result\PC\export\export_ansi.inf >nul
if %ERRORLEVEL% equ 0 (
    set ClearTextPassword=1
    echo �ص� ������ ��ȣȭ�� ����Ͽ� ��ȣ ����:                     ���
) else (
    set ClearTextPassword=0
    echo �ص� ������ ��ȣȭ�� ����Ͽ� ��ȣ ����:                ��� �� ��
)

echo ================================================================

set Result=���
if %ClearTextPassword% equ 0 (
    set Result=��ȣ
) 
	
	:: ��� ��� �� ����
if "%Result%" equ "��ȣ" (
    echo �� ��� : ��ȣ
    echo W-05,�Ҹ��� >> C:\result\Windows\result.txt
    
) else (
    echo �� ��� : ���   
    echo W-05,���� >> C:\result\Windows\result.txt
)

del C:\result\PC\export\export.inf
del C:\result\PC\export\export_ansi.inf	

pause