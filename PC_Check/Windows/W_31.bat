@echo off
:: C:\result ������ �������� ������ ����
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_31.txt del C:\result\Windows\export\W_31.txt

echo ================================================================
echo W-31: �ý��ۿ� �ֽ� �������� ����Ǿ� �ִ��� ����
echo ================================================================

systeminfo > C:\result\Windows\export\W_31_temp.txt 2>&1

:: OS ������ ���Ƚ� ������ �����ϰ�, ��� ���� ����
findstr /r "^OS" C:\result\Windows\export\W_31_temp.txt | findstr /v "C:\result\Windows\export\W_31_temp.txt" >> C:\result\Windows\export\W_31.txt

echo ���Ƚ�: >> C:\result\Windows\export\W_31.txt
findstr /r "KB" C:\result\Windows\export\W_31_temp.txt | findstr /v "C:\result\Windows\export\W_31_temp.txt" >> C:\result\Windows\export\W_31.txt

type C:\result\Windows\export\W_31.txt

echo ================================================================

echo �ֽ� �������� ��ġ�Ǿ� �ִ� ���: �� ���: ��ȣ
echo ================================================================
echo �ֽ� �������� ��ġ���� ���� ���: �� ���: ���
echo ================================================================
echo �� ���� ����
echo W-31,���� >> C:\result\Windows\result.txt

echo ================================================================

del C:\result\Windows\export\W_31_temp.txt
pause