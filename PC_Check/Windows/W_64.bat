@echo off
:: C:\result ������ �������� ������ ����
if not exist C:\result\Windows mkdir C:\result\Windows\export

:: ���� ��� ������ �����Ͽ� �ߺ� ��� ����
if exist C:\result\Windows\export\W_64.txt del C:\result\Windows\export\W_64.txt

echo ================================================================
echo W-64: HTTP/FTP/SNMP ���� ��� ���� ���� ���� ����
echo ================================================================

echo HTTP, FTP, SMTP ���� �� ��� ������ ������ �ʴ� ���
echo �� ���: ��ȣ
echo ================================================================
echo HTTP, FTP, SMTP ���� �� ��� ������ �������� ���
echo �� ���: ���
echo ================================================================
echo �� ���� ���� 
echo W-64,���� >> C:\result\Windows\result.txt
echo ================================================================

pause