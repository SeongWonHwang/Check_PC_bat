@echo off
:: C:\result\Windows\export ������ �������� ������ ����
if not exist C:\result\Windows\export mkdir C:\result\Windows\export

:: ���� W_74.txt ������ ����
if exist C:\result\Windows\export\W_74.txt del C:\result\Windows\export\W_74.txt

echo ================================================================
echo W-74: ���� ���� �ߴ� �� ���޽ð� ���� ���� ����
echo ================================================================

:: ������Ʈ�� �� ����
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" > C:\result\Windows\export\W_74.txt 2>&1

:: EnableForcedLogoff �� ��������
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "EnableForcedLogoff" ^| findstr "EnableForcedLogoff"') do set EnableForcedLogoffValue=%%A

:: autodisconnect �� ��������
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "autodisconnect" ^| findstr "autodisconnect"') do set autodisconnectValue=%%A

echo ================================================================

:: �ʱ� ��� ���� ����
set result=��� ����
set result_temp=���

:: EnableForcedLogoff ���� 0x0�̸� ������� ����
if "%EnableForcedLogoffValue%"=="0x1" (
    set result=���
	if defined autodisconnectValue if "%autodisconnectValue%" equ "0xf" (
    set result_temp=��ȣ
	set /a autodisconnectValueDec=autodisconnectValue
	)
)

echo Microsoft ��Ʈ��ũ ����: �α׿� �ð��� ����Ǹ� Ŭ���̾�Ʈ ���� ����: %result%
echo Microsoft ��Ʈ��ũ ����: ���� ������ �ߴ��ϱ� ���� �ʿ��� ���� �ð�: %autodisconnectValueDec%��
echo ================================================================

:: ����� ���� ���Ͽ� ���
if "%result_temp%"=="���" (
    echo W-74,�Ҹ��� >> C:\result\Windows\result.txt
    echo �� ��� : ���
) else (
    echo W-74,���� >> C:\result\Windows\result.txt
    echo �� ��� : ��ȣ
)

echo ================================================================
pause