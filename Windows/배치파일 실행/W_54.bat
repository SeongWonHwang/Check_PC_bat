@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-54: �͸� SID/�̸� ��ȯ ��� ����
echo ================================================================

:: ���� ��å�� inf ���Ϸ� �������ϴ�.
secedit /export /cfg C:\result\Windows\export\export.inf /areas SECURITYPOLICY >nul 2>&1

type C:\result\Windows\export\export.inf > C:\result\Windows\export\export_ansi.inf


:: ������ ���Ͽ��� LSAAnonymousNameLookup ������ Ȯ���մϴ�.
findstr /r /c:"LSAAnonymousNameLookup = 1" C:\result\Windows\export\export_ansi.inf >nul
if %ERRORLEVEL% equ 0 (
    set LSAAnonymousNameLookup=1
    echo ��Ʈ��ũ �׼���: �͸� SID/�̸� ��ȯ ���: ���
) else (
    set LSAAnonymousNameLookup=0
    echo ��Ʈ��ũ �׼���: �͸� SID/�̸� ��ȯ ���: ��� �� ��
)

:: ��� ��
set Result=��ȣ
if %LSAAnonymousNameLookup% equ 0 (
    set Result=���
)
echo ================================================================

:: ��� ��� �� ����
if "%Result%" equ "��ȣ" (
    echo �� ��� : ���
    echo W-54,�Ҹ��� >> C:\result\Windows\result.txt
) else (
    echo �� ��� : ��ȣ
    echo W-54,���� >> C:\result\Windows\result.txt
)

echo ================================================================

del C:\result\Windows\export\export.inf
del C:\result\Windows\export\export_ansi.inf	

pause