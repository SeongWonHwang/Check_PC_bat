@echo off
:: C:\result ������ �������� ������ ����
if not exist C:\result\PC mkdir C:\result\PC\export

echo ================================================================
echo PC-05: ����� PC���� ��� �޽����� ����ϰ� �ִ����� ����
echo ================================================================

:: �ʱ� result ���� ��ȣ�� ����
set result=���

:: PreventRunValue ������ �ʱ�ȭ
set PreventRunValue=

:: ������Ʈ�� �� ��������
reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Messenger\Client" > C:\result\PC\export\PC_05.txt 2>&1

:: PreventRun �� ��������
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Messenger\Client" /v "PreventRun" ^| findstr "PreventRun"') do set PreventRunValue=%%A

:: PreventRun ���� ���� ���� ���� ��� ó��
if not defined PreventRunValue (
echo ������Ʈ�� Ű�� �������� ���� >> C:\result\PC\result.txt
	echo Windows Messenger ���� ��� �� ��: �������� ����
	echo ================================================================
    echo �� ��� : ���
    goto End
)
if "%PreventRunValue%" equ "0x1" (
    set result=��ȣ
)

echo ================================================================

:: ��� ���
if %result%==��� (
    echo PC-05,�Ҹ��� >> C:\result\PC\result.txt
		echo Windows Messenger ���� ��� �� ��: ��� �� ��
	echo ================================================================
    echo �� ��� : ���
) else (
    echo PC-05,���� >> C:\result\PC\result.txt
		echo Windows Messenger ���� ��� �� ��: ���
	echo ================================================================
    echo �� ��� : ��ȣ
)

:End
echo ================================================================
pause