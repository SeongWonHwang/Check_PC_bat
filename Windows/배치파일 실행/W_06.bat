@echo off

:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-06: ������ �׷쿡 ���ʿ��� ������� ���� ���� ����
echo ================================================================
 
net localgroup administrators | findstr /v /c:"����� �� �����߽��ϴ�" > C:\result\Windows\export\W_06.txt

type C:\result\Windows\export\W_06.txt

echo ================================================================
echo ������ ��Ͽ�
echo Administrator
echo PC ����
echo �� ������ ���� ��:              �� ��� : ��ȣ
echo ���� �ٸ� ���ʿ��� ���� �����: �� ��� : ���
echo ================================================================

pause