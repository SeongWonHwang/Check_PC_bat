@echo off

:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\PC mkdir C:\result\PC\export

echo ================================================================
echo PC-18: ������ ���ͳ� �ɼǿ� �ִ� ��� ������ ���������� ���� �� �ӽ� ���ͳ� ���� ���� ���⡱ ����� Ȱ��ȭ �Ǿ� �ִ��� ����
echo ================================================================

REM Query the registry value and write to the file
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\InternetSettings\Cache" >> C:\result\PC\export\PC_18.txt 2>&1

:: �ʱ� result ���� ������� ����
set result=���

:: SecurityLevelValue ������ �ʱ�ȭ
set PersistentValue=

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\InternetSettings\Cache" /v "Persistent" 2^>nul ^| findstr "Persistent"') do set PersistentValue=%%A

:: Persistent ���� �������� ���� ��� ó��
if not defined PersistentValue (
		echo PC-18,�Ҹ��� >> C:\result\PC\result.txt
		echo �������� ���� �� �ӽ� ���ͳ� ���� ���� ���⡱ ������ ����롱���� �����Ǿ� ���� ����
		echo ================================================================
		echo �� ��� : ���
    goto End
)

:: Persistent �� Ȯ�� �� ��� ����
if "%PersistentValue%"=="0x0" (
    set result=��ȣ
)

:: ��� ���
if "%result%"=="��ȣ" (
	echo PC-18,���� >> C:\result\PC\result.txt
		echo �������� ���� �� �ӽ� ���ͳ� ���� ���� ���⡱ ������ ����롱���� ������
		echo ================================================================
		echo �� ��� : ��ȣ
    ) else (
		echo PC-18,�Ҹ��� >> C:\result\PC\result.txt
		echo �������� ���� �� �ӽ� ���ͳ� ���� ���� ���⡱ ������ ����롱���� �����Ǿ� ���� ����
		echo ================================================================
		echo �� ��� : ���
		)

:End
echo ================================================================
pause