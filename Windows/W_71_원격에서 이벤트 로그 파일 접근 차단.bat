@echo off

:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-71: ���ݿ��� �α� ������ ������ �����ϱ� ���� ���� ������ ����
echo ================================================================

REM Get and display all user accounts without the header, separator, empty lines, and unnecessary messages
icacls %systemroot%\system32\config | find /v "������ ó��������" > C:\result\Windows\export\W_71.txt

echo ���� ����� ����:
type C:\result\Windows\export\W_71.txt

echo ================================================================
echo Everyone ������ �ִ� ��� �� ��� : ���
echo Everyone ������ ���� ��� �� ��� : ��ȣ
echo ================================================================

pause