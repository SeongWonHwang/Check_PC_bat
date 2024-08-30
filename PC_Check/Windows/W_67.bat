@echo off
:: C:\result ������ �������� ������ ����
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-67: �����͹̳� ���� Ÿ�Ӿƿ� ���� ���� ����
echo ================================================================

:: �ʱ� result ���� ��ȣ�� ����
set result=��ȣ

:: MaxIdleTimeValue ������ �ʱ�ȭ
set MaxIdleTimeValue=

:: ������Ʈ�� ���� �����ϰ� ����� ���Ͽ� ����
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" > C:\result\Windows\export\W_67.txt 2>&1

:: MaxIdleTime ���� ��������
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "MaxIdleTime" 2^>nul ^| findstr "MaxIdleTime"') do set MaxIdleTimeValue=%%A

:: MaxIdleTime ���� �������� ���� ��� ó��
if not defined MaxIdleTimeValue (
	echo Ȱ�� �������� ���� �͹̳� ���� ���ǿ� �ð� ���� ����: �������� ����
	echo ================================================================
	echo W-67,�Ҹ��� >> C:\result\Windows\result.txt
    echo �� ��� : ���
    goto End
)

:: MaxIdleTime ���� ���ǵ� ��쿡�� ��� ���� ����
set /a MaxIdleTimeDec=%MaxIdleTimeValue%/60000
echo MaxIdleTime ��: %MaxIdleTimeDec%��

if %MaxIdleTimeValue% GTR 1800000 (
    set result=���
)

echo ================================================================

:: ��� ���
if %result%==��� (
    echo W-67,�Ҹ��� >> C:\result\Windows\result.txt
    echo �� ��� : ���
) else (
    echo W-67,���� >> C:\result\Windows\result.txt
    echo �� ��� : ��ȣ
)

:End
echo ================================================================
pause