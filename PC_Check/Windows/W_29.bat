@echo off
:: C:\result ������ �������� ������ ����
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-29: DNS Zone Transfer ���� ���� ���� ����
echo ================================================================

::�ʱ� result ���� ��ȣ���� ����
set result=��ȣ

:: SecureSecondariesValue ������ �ʱ�ȭ
set SecureSecondariesValue=

:: ������Ʈ�� �� ��������
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones\jinis" >> C:\result\Windows\export\W_29.txt 2>&1

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones\jinis" /v "SecureSecondaries" 2^>nul ^| findstr "SecureSecondaries"') do set SecureSecondariesValue=%%A

if not defined SecureSecondariesValue (
	echo W-29,���� >> C:\result\Windows\result.txt
    echo ================================================================
	echo DNS Service ������� ����
	    echo ================================================================
    echo �� ��� : ��ȣ
    goto End
)

:: SecureSecondaries �� Ȯ�� �� ��� ����
if "%SecureSecondariesValue"=="0x1" (
set result=���
)

echo ================================================================

:: ��� ���
if "%result%"=="���" (
echo W-29,���� >> C:\result\Windows\result.txt
echo DNS Service ���
echo ================================================================
echo �� ��� : ���
) else (
echo W-29,�Ҹ��� >> C:\result\Windows\result.txt
echo DNS Service ������� ����
echo ================================================================
echo �� ��� : ��ȣ
)

:End
echo ================================================================
pause