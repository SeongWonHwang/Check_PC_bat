@echo off
:: C:\result ������ �������� ������ ����
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_32.txt del C:\result\Windows\export\W_32.txt

echo ================================================================
echo W-32: �ֽ� Hot Fix ���� ���� ����
echo ================================================================

systeminfo > C:\result\Windows\export\W_32_temp.txt 2>&1

:: OS ������ ���Ƚ� ������ �����ϰ�, ��� ���� ����
findstr /r "^OS" C:\result\Windows\export\W_32_temp.txt | findstr /v "C:\result\Windows\export\W_32_temp.txt" >> C:\result\Windows\export\W_32.txt

echo ���Ƚ�: >> C:\result\Windows\export\W_32.txt
findstr /r "KB" C:\result\Windows\export\W_32_temp.txt | findstr /v "C:\result\Windows\export\W_32_temp.txt" >> C:\result\Windows\export\W_32.txt

type C:\result\Windows\export\W_32.txt

echo ================================================================

echo �ֽ� Hotfix �Ǵ�,PMS(Patch Management System) Agent�� ��ġ�Ǿ� �ִ� ���
echo - ����ý��� ��ġ ������Ʈ ���ء����� �� ��ġ ���� ��å�� �����Ǿ��ְ�, ��å�� ���� �ֱ������� ��ġ ������Ʈ ����, ������Ʈ �� �����ϴ� ���: 
echo �� ���: ��ȣ
echo ================================================================
echo 1. �ֽ� Hotfix �Ǵ�, PMS(Patch Management System) Agent�� ��ġ�Ǿ� ���� ���� ���
echo - ������ ��å�� ���ų�, ��å�� ������ �ʰų�, 3���� �̳��� Hotfix �̷��� ���� ���
echo 2. MS������� ����� �ü�� ���: 
echo �� ���: ���
echo ================================================================
echo �� ���� ����
echo W-32,���� >> C:\result\Windows\result.txt

echo ================================================================

del C:\result\Windows\export\W_32_temp.txt
pause