@echo off
:: C:\result ������ �������� ������ ����
if not exist C:\result\Windows mkdir C:\result\Windows\export

:: ���� ��� ������ �����Ͽ� �ߺ� ��� ����
if exist C:\result\Windows\export\W_61.txt del C:\result\Windows\export\W_61.txt

echo ================================================================
echo W-61: SNMP ���� Ŀ�´�Ƽ ��Ʈ��(Community String) ������ ����
echo ================================================================

sc query "SNMPTRAP" | find "RUNNING" >nul
if %ERRORLEVEL%==0 (
    echo SNMP ���񽺰� ���� ���Դϴ�.
echo ================================================================
) else (
    echo SNMP ���񽺰� ���� ������ �ʽ��ϴ�.
echo ================================================================
)

echo SNMP ���񽺸� ������� �ʰų� Community �̸��� public, private�� �ƴ� ��� (���� ������ �� ��� �� �ǰ�)
echo �� ���: ��ȣ
echo ================================================================
echo 1. SNMP ���񽺸� ����ϸ�, Community �̸��� public, private�� ���
echo 2. SNMP ���񽺸� ������� ������ ��Ʈ(161)�� ���� �ִ� ���
echo �� ���: ���
echo ================================================================
echo �� ���� ���� 
echo W-61,���� >> C:\result\Windows\result.txt
echo ================================================================

pause