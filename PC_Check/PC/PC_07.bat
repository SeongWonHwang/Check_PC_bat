@echo off
:: C:\result ������ �������� ������ ����
if not exist C:\result\PC mkdir C:\result\PC\export

if exist C:\result\PC\export\PC_07.txt del C:\result\PC\export\PC_07.txt

echo ================================================================
echo PC-07: �ý��ۿ� �ֽ� �������� ����Ǿ� �ִ��� ����
echo ================================================================

systeminfo > C:\result\PC\export\PC_07_temp.txt 2>&1

:: OS ������ ���Ƚ� ������ �����ϰ�, ��� ���� ����
findstr /r "^OS" C:\result\PC\export\PC_07_temp.txt | findstr /v "C:\result\PC\export\PC_07_temp.txt" >> C:\result\PC\export\PC_07.txt

echo ���Ƚ�: >> C:\result\PC\export\PC_07.txt
findstr /r "KB" C:\result\PC\export\PC_07_temp.txt | findstr /v "C:\result\PC\export\PC_07_temp.txt" >> C:\result\PC\export\PC_07.txt

type C:\result\PC\export\PC_07.txt

echo ================================================================

echo �ֽ� �������� ���� �Ǿ� �ְ� ���������� ���� ������ �����Ͽ� �����ϰ� �ִ� ���   : �� ���: ��ȣ
echo ================================================================
echo �ֽ� �������� ���� �Ǿ� ���� �ʰų� ���������� ���� ������ �����Ǿ� ���� ���� ���: �� ���: ���
echo ================================================================
echo �� ���� ����
echo PC-07,���� >> C:\result\PC\result.txt

echo ================================================================

del C:\result\PC\export\PC_07_temp.txt
pause