@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-67: �����͹̳� ���� Ÿ�Ӿƿ� ���� ���� ����
echo ================================================================

:: �ʱ� result ���� 1���� ���� (��ȣ)
set result=1

:: MaxIdleTimeValue ������ �ʱ�ȭ�մϴ�.
set MaxIdleTimeValue=

:: ������Ʈ�� ���� �����ϰ� ����� ���Ͽ� ����
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" > C:\result\Windows\export\W_67.txt 2>&1

:: MaxIdleTime ���� ��������
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "MaxIdleTime" ^| findstr "MaxIdleTime"') do set MaxIdleTimeValue=%%A

set /a MaxIdleTimeDec=%MaxIdleTimeValue%/60000

echo MaxIdleTime ��: %MaxIdleTimeDec%��
    
:: MaxIdleTime ���� �����Ǿ����� Ȯ��
if defined MaxIdleTimeValue (

    
    if not "%MaxIdleTimeDec%" GEQ "1800000" (
        set result=0
    )
)


echo ================================================================

:: ��� ���
if %result%==1 (
    echo W-67,���� >> C:\result\Windows\result.txt
    echo �� ��� : ��ȣ
) else (
    echo W-67,�Ҹ��� >> C:\result\Windows\result.txt
    echo �� ��� : ���
)

echo ================================================================
pause