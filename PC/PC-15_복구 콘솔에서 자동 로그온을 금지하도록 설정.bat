@echo off
:: C:\result ������ �������� ������ ����
if not exist C:\result\PC mkdir C:\result\PC\export

echo ================================================================
echo PC-15: ������ ���� �ܼ� �ڵ� �α��� ������ ���Ǿ� �ִ��� ����
echo ================================================================

:: �ʱ� result ���� ������� ����
set result=���

:: SecurityLevelValue ������ �ʱ�ȭ
set SecurityLevelValue=

:: ������Ʈ�� �� ��������
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole" > C:\result\PC\export\PC_15.txt 2>&1

:: SecurityLevel �� ��������
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole" /v "SecurityLevel" ^| findstr "SecurityLevel"') do set SecurityLevelValue=%%A

:: SecurityLevel ���� �������� ���� ��� ó��
if not defined SecurityLevelValue (
    echo ������Ʈ�� Ű�� �������� ���� >> C:\result\PC\result.txt
    echo ��ȭ�� ���� ����
    echo ================================================================
    echo �� ��� : ���
    goto End
)

:: SecurityLevel �� Ȯ�� �� ��� ����
if "%SecurityLevelValue%"=="0x1" (
    set result=��ȣ
)

echo ================================================================

:: ��� ���
if "%result%"=="���" (
	echo PC-15,���� >> C:\result\PC\result.txt
		echo ���� �ܼ�: �ڵ� ���� �α׿� ���: ��� ����
		echo ================================================================
		echo �� ��� : ��ȣ 
    ) else (
		echo PC-15,�Ҹ��� >> C:\result\PC\result.txt
		echo ���� �ܼ�: �ڵ� ���� �α׿� ���: ���
		echo ================================================================
		echo �� ��� : ���
		)

:End
echo ================================================================
pause