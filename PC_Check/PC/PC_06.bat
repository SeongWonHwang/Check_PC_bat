@echo off
:: C:\result ������ �������� ������ ����
if not exist C:\result\PC mkdir C:\result\PC\export

if exist C:\result\PC\export\PC_06.txt del C:\result\PC\export\PC_06.txt

echo ================================================================
echo PC-06: �ý��ۿ� ������ ������ ������� ���� �ֽ� ������ġ�� �����Ͽ����� ����
echo ================================================================

systeminfo > C:\result\PC\export\PC_06_temp.txt 2>&1

:: OS ������ ���Ƚ� ������ �����ϰ�, ��� ���� ����
findstr /r "^OS" C:\result\PC\export\PC_06_temp.txt | findstr /v "C:\result\PC\export\PC_06_temp.txt" >> C:\result\PC\export\PC_06.txt

echo ���Ƚ�: >> C:\result\PC\export\PC_06.txt
findstr /r "KB" C:\result\PC\export\PC_06_temp.txt | findstr /v "C:\result\PC\export\PC_06_temp.txt" >> C:\result\PC\export\PC_06.txt

type C:\result\PC\export\PC_06.txt

echo ================================================================
echo HOT FIX ��ġ �� �ڵ� ������Ʈ ������ �Ǿ� �ְ� ���������� ���� ������ �����Ͽ� �����ϰ� �ִ� ���: �� ���: ��ȣ
echo ================================================================
echo HOT FIX�� ��ġ�Ǿ� ���� �ʰų� ���������� ���� ������ �����Ǿ� ���� ���� ���                    : �� ���: ���
echo ================================================================
echo �� ���� ����
echo PC-06,���� >> C:\result\PC\result.txt

echo ================================================================

del C:\result\PC\export\PC_06_temp.txt
pause