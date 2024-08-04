@echo off

:: C:\result\PC\export ������ ������ ����
if not exist C:\result\PC mkdir C:\result\PC\export

echo ================================================================
echo PC-02: �н����� ���� ��å�� ���⼺�� �����ϴ��� ����
echo ================================================================

:: �ִ� ��ȣ ��� �Ⱓ�� CMD â�� ����ϰ�, C:\result\PC\export\PC_02.txt ���Ϸ� ���
net accounts | find "�ּ� ��ȣ ����"
net accounts | find "Minimum password length"
net accounts | find "�ּ� ��ȣ ����" > C:\result\PC\export\PC_02.txt

:: PC_02.txt ���Ͽ��� �ִ� ��ȣ ��� �Ⱓ ���� �����Ͽ� ���� PC_02�� ����
for /f "tokens=4" %%a in (C:\result\PC\export\PC_02.txt) do set PC_02=%%a 

:: ���� ��å�� inf ���Ϸ� �������ϴ�.
secedit /export /cfg C:\result\PC\export\export.inf /areas SECURITYPOLICY >nul 2>&1

:: UTF-16 ������ ANSI�� ��ȯ
type C:\result\PC\export\export.inf > C:\result\PC\export\export_ansi.inf

:: ������ ���Ͽ��� PasswordComplexity ������ Ȯ���մϴ�.
findstr /r /c:"PasswordComplexity = 1" C:\result\PC\export\export_ansi.inf >nul
if %ERRORLEVEL% equ 0 (
    set PasswordComplexity=1
    echo ��ȣ�� ���⼺�� �����ؾ� ��:                              ���
) else (
    set PasswordComplexity=0
    echo ��ȣ�� ���⼺�� �����ؾ� ��:                          ��� �� ��
)

:: ��� ��
set Result=��ȣ
if %PC_02% LSS 8 (
    set Result=���
)

if %PasswordComplexity% equ 0 (
    set Result=���
)
echo ================================================================

:: ��� ��� �� ����
if "%Result%" equ "��ȣ" (
    echo �� ��� : ��ȣ
    echo PC-02,���� >> C:\result\PC\result.txt
) else (
    echo �� ��� : ���
    echo PC-02,�Ҹ��� >> C:\result\PC\result.txt
)

echo ================================================================

del C:\result\PC\export\export.inf
del C:\result\PC\export\export_ansi.inf	

pause