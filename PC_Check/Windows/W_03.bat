@echo off

:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-03: �ý��� �� ���ʿ��� ���� �� �ǽɽ����� ������ ���� ���θ� ����
echo ================================================================

:: ���� ���
net user | findstr /v /c:"����� ����" | findstr /v /c:"---" | findstr /v /c:"����� �� �����߽��ϴ�" | findstr /r /v "^$" > C:\result\Windows\export\W_03.txt

echo ���� ����� ����:
type C:\result\Windows\export\W_03.txt

echo ================================================================
echo Administrator
echo PC ����
echo castle
echo OPER
echo Guest
echo ================================================================
echo �� ������ ���� ��             : �� ��� : ��ȣ
echo ���� �ٸ� ���ʿ��� ���� �����: �� ��� : ���
echo ================================================================
echo �� ���� ����
echo W-03,���� >> C:\result\Windows\result.txt
echo ================================================================

pause