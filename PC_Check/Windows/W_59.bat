@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_59.txt del C:\result\Windows\export\W_59.txt
echo ================================================================
echo W-59: IIS ������ ���� ���� ���� ���� ����
echo ================================================================

net start | find /I "llSADMIN" > C:\result\Windows\export\W_59.txt

type C:\result\Windows\export\W_59.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_59.txt) do (
    if %%~zA==0 (
    echo llS ���񽺰� ���� ������ �ʽ��ϴ�. >> C:\result\Windows\export\W_59.txt
	echo llS ���񽺰� ���� ������ �ʽ��ϴ�.
echo ================================================================
    ) else (
    echo llS ���񽺰� ���� ���Դϴ�. >> C:\result\Windows\export\W_59.txt
	echo llS ���񽺰� ���� ���Դϴ�.
echo ================================================================
    )
)

echo 1. �� ���� ���� �������� ������ �����Ǿ� �ִ� ���
echo 2. IIS�� ��ġ���� �ʾ��� ���
echo 3. IIS ���񽺸� ������� ������ ��Ʈ(80)�� ���� ���
echo �� ���: ��ȣ
echo ================================================================
echo �� ���� ���� �������� ������ �������� �ʾ� ���� �߻� �� �߿� ������ ���� �Ǵ� ���
echo �� ���: ���
echo ================================================================
echo �� ���� ���� 
echo W-59,���� >> C:\result\Windows\result.txt
echo ================================================================

pause