@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_11.txt del C:\result\Windows\export\W_11.txt
echo ================================================================
echo W-11: ������ ���丮 ������ ���� ���� ���� ����
echo ================================================================

net start | find /I "llSADMIN" > C:\result\Windows\export\W_11.txt

type C:\result\Windows\export\W_11.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_11.txt) do (
    if %%~zA==0 (
    echo llS ���񽺰� ���� ������ �ʽ��ϴ�. >> C:\result\Windows\export\W_11.txt
	echo llS ���񽺰� ���� ������ �ʽ��ϴ�.
echo ================================================================
    ) else (
    echo llS ���񽺰� ���� ���Դϴ�. >> C:\result\Windows\export\W_11.txt
	echo llS ���񽺰� ���� ���Դϴ�.
echo ================================================================
    )
)

echo 1. �����丮 �˻����� üũ�Ǿ� ���� ���� ���
echo 2. IIS�� ��ġ���� �ʾ��� �� : 
echo �� ���: ��ȣ
echo ================================================================
echo �����丮 �˻����� üũ�Ǿ� �ִ� ���
echo �� ��ġ �� ������ �Ӽ��� ��� ����Ʈ�� ������  : 
echo �� ���: ���
echo ================================================================
echo �� ���� ���� 
echo W-11,���� >> C:\result\Windows\result.txt
echo ================================================================

pause