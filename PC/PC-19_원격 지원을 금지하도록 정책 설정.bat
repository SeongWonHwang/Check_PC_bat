@echo off
:: C:\result ������ �������� ������ ����
if not exist C:\result\PC mkdir C:\result\PC\export

echo ================================================================
echo PC-19: ���� ������ ������� �ʵ��� �����ϰ� �ִ��� ����
echo ================================================================

::�ʱ� result ���� ��ȣ���� ����
set result=��ȣ

:: fAllowUnsolicitedValue ������ �ʱ�ȭ
set fAllowUnsolicitedValue=

:: ������Ʈ�� �� ��������
reg query "HKEY_LOCAL_MACHINE\Software\policies\Microsoft\Windows NT\Terminal Services" >> C:\result\PC\export\PC_19.txt 2>&1

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\Software\policies\Microsoft\Windows NT\Terminal Services" /v "fAllowUnsolicited" ^| findstr "fAllowUnsolicited"') do set fAllowUnsolicitedValue=%%A

if not defined fAllowUnsolicitedValue (
	echo PC-19,���� >> C:\result\PC\result.txt
    echo ================================================================
	echo ���� ���� ����: �������� ����
	    echo ================================================================
    echo �� ��� : ��ȣ
    goto End
)

:: fAllowUnsolicited �� Ȯ�� �� ��� ����
if "%fAllowUnsolicitedValue"=="0x1" (
set result=���
)

echo ================================================================

:: ��� ���
if "%result%"=="���" (
echo PC-19,���� >> C:\result\PC\result.txt
echo ���� ���� ����: ���
echo ================================================================
echo �� ��� : ���
) else (
echo PC-19,�Ҹ��� >> C:\result\PC\result.txt
echo ���� ���� ����: ��� �� ��
echo ================================================================
echo �� ��� : ��ȣ
)

:End
echo ================================================================
pause