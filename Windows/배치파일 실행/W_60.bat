@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

:: ���� ��� ������ �����Ͽ� �ߺ� ��� ����
if exist C:\result\Windows\export\W_57.txt del C:\result\Windows\export\W_57.txt

echo ================================================================
echo W-60: SNMP ���� ���� ���� ����
echo ================================================================

sc query "SNMPTRAP" | find "RUNNING" >nul
if %ERRORLEVEL%==0 (
    echo SNMP ���񽺰� ���� ���Դϴ�.
echo ================================================================
 echo �� ��� : ���
echo W-60,�Ҹ��� >> C:\result\Windows\result.txt
) else (
    echo SNMP ���񽺰� ���� ������ �ʽ��ϴ�.
echo ================================================================
echo �� ��� : ��ȣ
echo W-60,���� >> C:\result\Windows\result.txt
)

echo ================================================================
pause