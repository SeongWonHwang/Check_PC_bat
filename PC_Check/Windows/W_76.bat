@echo off
:: C:\result ������ �������� ������ ����
if not exist C:\result\Windows mkdir C:\result\Windows\export

:: ���� ��� ������ �����Ͽ� �ߺ� ��� ����
if exist C:\result\Windows\export\W_76.txt del C:\result\Windows\export\W_76.txt

echo ================================================================
echo W-76: ����� Ȩ ���丮 ���� ������ ����
echo ================================================================

echo Ȩ ���丮�� Everyone ������ ���� ��� (All Users, Default User ���丮 ����)
echo �� ���: ��ȣ
echo ================================================================
echo Ȩ ���丮�� Everyone ������ �ִ� ���
echo �� ���: ���
echo ================================================================
echo �� ���� ���� 
echo W-76,���� >> C:\result\Windows\result.txt
echo ================================================================

pause