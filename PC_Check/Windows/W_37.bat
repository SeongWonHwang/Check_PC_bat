@echo off

:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-37: SAM ���� ���� ���� ���� ���� ����
echo ================================================================

:: ���� ���� Ȯ��
icacls %systemroot%\system32\config\SAM | find /v "������ ó��������" > C:\result\Windows\export\W_37.txt

type C:\result\Windows\export\W_37.txt

echo ================================================================
echo Everyone ������ �ִ� ��� �� ��� : ���
echo Everyone ������ ���� ��� �� ��� : ��ȣ
echo ================================================================
echo �� ���� ���� 
echo W-37,���� >> C:\result\Windows\result.txt

pause