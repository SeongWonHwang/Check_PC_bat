@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_18.txt del C:\result\Windows\export\W_18.txt

echo ================================================================
echo W-18: Global.asa �Ǵ� ������ DB ���ؼ��� �ϴ� ���Ͽ� ���� ����� ����
echo ================================================================

net start | find /I "llSADMIN" > C:\result\Windows\export\W_18.txt

type C:\result\Windows\export\W_18.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_18.txt) do (
    if %%~zA==0 (
    echo llS ���񽺰� ���� ������ �ʽ��ϴ�. >> C:\result\Windows\export\W_18.txt
	echo llS ���񽺰� ���� ������ �ʽ��ϴ�.
echo ================================================================
    ) else (
    echo llS ���񽺰� ���� ���Դϴ�. >> C:\result\Windows\export\W_18.txt
	echo llS ���񽺰� ���� ���Դϴ�.
echo ================================================================
    )
)

echo 1. IIS 5.0, 6.0
echo - .asa ������ �����ϴ� ���
echo 2. IIS 7.0, 8.0, 10.0
echo - ��û ���͸����� .asa, .asax ������ ���ų�, Ȯ���ڰ� False ������ ���
echo 3. IIS�� ��ġ���� �ʾ��� ��
echo �� ���: ��ȣ
echo ================================================================
echo 1. IIS 5.0, 6.0
echo - .asa ������ �������� �ʴ� ���
echo 2. IIS 7.0, 8.0, 10.0
echo - ��û ���͸����� .asa, .asax ������ �����ϰ�, Ȯ���ڰ� True ������ ���
echo �� ���: ���
echo ================================================================
echo �� ���� ���� 
echo W-18,���� >> C:\result\Windows\result.txt
echo ================================================================

pause