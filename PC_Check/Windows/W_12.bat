@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_12.txt del C:\result\Windows\export\W_12.txt
echo ================================================================
echo W-12: IIS CGI ���� ���� ���� ���� ����
echo ================================================================

net start | find /I "llSADMIN" > C:\result\Windows\export\W_12.txt

type C:\result\Windows\export\W_12.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_12.txt) do (
    if %%~zA==0 (
    echo llS ���񽺰� ���� ������ �ʽ��ϴ�. >> C:\result\Windows\export\W_12.txt
	echo llS ���񽺰� ���� ������ �ʽ��ϴ�.
echo ================================================================
    ) else (
    echo llS ���񽺰� ���� ���Դϴ�. >> C:\result\Windows\export\W_12.txt
	echo llS ���񽺰� ���� ���Դϴ�.
echo ================================================================
    )
)


echo 1. IIS Home Directory�� scripts ������ ���� ���
echo 2. �ش� ���丮 Everyone�� ��� ����, ���� ����, ���� ������ �ο����� ���� ���
echo 3. IIS�� ��ġ���� �ʾ��� ��
echo �� ���: ��ȣ
echo ================================================================
echo �ش� ���丮 Everyone�� ��� ����, ���� ����, ���� ������ �ο��Ǿ� �ִ� ���
echo �� ��ġ �� ������ �Ӽ��� ��� ����Ʈ�� ������
echo �� ���: ���
echo ================================================================
echo �� ���� ���� 
echo W-12,���� >> C:\result\Windows\result.txt
echo ================================================================

pause