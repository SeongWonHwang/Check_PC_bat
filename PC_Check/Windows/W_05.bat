@echo off

:: C:\result ������ �������� ������ ����
if not exist C:\result\Windows mkdir C:\result\Windows\export

:: ���� ��� ������ �����Ͽ� �ߺ� ��� ����
if exist C:\result\Windows\export\W_05.txt del C:\result\Windows\export\W_05.txt

echo ================================================================
echo W-05: �ص� ������ ��ȣȭ ��� ���� ����
echo ================================================================

:: ���� ��å�� inf ���Ϸ� ������
secedit /export /cfg C:\result\Windows\export\export.inf /areas SECURITYPOLICY >nul 2>&1


:: UTF-16 ������ ANSI�� ��ȯ
type C:\result\Windows\export\export.inf > C:\result\Windows\export\export_ansi.inf

:: ������ ���Ͽ��� PasswordComplexity ������ Ȯ��
findstr /r /c:"ClearTextPassword = 1" C:\result\Windows\export\export_ansi.inf >nul
if %ERRORLEVEL% equ 0 (
    set ClearTextPassword=1
    echo �ص� ������ ��ȣȭ�� ����Ͽ� ��ȣ ����:                     ��� >> C:\result\Windows\export\W_05.txt
	echo �ص� ������ ��ȣȭ�� ����Ͽ� ��ȣ ����:                     ���
) else (
    set ClearTextPassword=0
    echo �ص� ������ ��ȣȭ�� ����Ͽ� ��ȣ ����:                ��� �� �� >> C:\result\Windows\export\W_05.txt
	echo �ص� ������ ��ȣȭ�� ����Ͽ� ��ȣ ����:                ��� �� ��
)

echo ================================================================

set Result=���
if %ClearTextPassword% equ 0 (
    set Result=��ȣ
) 
	
if "%Result%" equ "��ȣ" (
    echo �� ��� : ��ȣ
    echo W-05,�Ҹ��� >> C:\result\Windows\result.txt
    
) else (
    echo �� ��� : ���   
    echo W-05,���� >> C:\result\Windows\result.txt
)

del C:\result\Windows\export\export.inf
del C:\result\Windows\export\export_ansi.inf	

pause