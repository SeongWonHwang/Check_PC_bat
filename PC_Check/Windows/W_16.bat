@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_16.txt del C:\result\Windows\export\W_16.txt

echo ================================================================
echo W-16: IIS ��ũ ������ ���� ���� ����
echo ================================================================

net start | find /I "llSADMIN" > C:\result\Windows\export\W_16.txt

type C:\result\Windows\export\W_16.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_16.txt) do (
    if %%~zA==0 (
    echo llS ���񽺰� ���� ������ �ʽ��ϴ�. >> C:\result\Windows\export\W_16.txt
	echo llS ���񽺰� ���� ������ �ʽ��ϴ�.
echo ================================================================
    ) else (
    echo llS ���񽺰� ���� ���Դϴ�. >> C:\result\Windows\export\W_16.txt
	echo llS ���񽺰� ���� ���Դϴ�.
echo ================================================================
    )
)

echo 1. �ɺ��� ��ũ, aliases, �ٷΰ��� ���� ����� ������� �ʴ� ���
echo 2. IIS�� ��ġ���� �ʾ��� ��
echo �� ���: ��ȣ
echo ================================================================
echo �ɺ��� ��ũ, aliases, �ٷΰ��� ���� ����� ����ϴ� ���
echo �� ���: ���
echo ================================================================
echo �� ���� ���� 
echo W-16,���� >> C:\result\Windows\result.txt
echo ================================================================

pause