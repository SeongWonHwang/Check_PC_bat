@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_19.txt del C:\result\Windows\export\W_19.txt

echo ================================================================
echo W-19: ���ʿ��� IIS ���� ���丮 ���� ���� ����
echo ================================================================

net start | find /I "llSADMIN" > C:\result\Windows\export\W_19.txt

type C:\result\Windows\export\W_19.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_19.txt) do (
    if %%~zA==0 (
    echo llS ���񽺰� ���� ������ �ʽ��ϴ�. >> C:\result\Windows\export\W_19.txt
	echo llS ���񽺰� ���� ������ �ʽ��ϴ�.
echo ================================================================
    ) else (
    echo llS ���񽺰� ���� ���Դϴ�. >> C:\result\Windows\export\W_19.txt
	echo llS ���񽺰� ���� ���Դϴ�.
echo ================================================================
    )
)


echo 1. IIS 6.0 �̻� ����ϴ� ���
echo 2. �ش� �� ����Ʈ�� IIS Admin, IIS Adminpwd ���� ���丮�� �������� �ʴ� ���
echo 3. IIS�� ��ġ���� �ʾ��� ��
echo �� ���: ��ȣ
echo ================================================================
echo �ش� �� ����Ʈ�� IIS Admin, IIS Adminpwd ���� ���丮�� �����ϴ� ���
echo �� ��ġ �� ������ �Ӽ��� ��� ����Ʈ�� ������
echo �� ���: ���
echo ================================================================
echo �� ���� ���� 
echo W-19,���� >> C:\result\Windows\result.txt
echo ================================================================

pause