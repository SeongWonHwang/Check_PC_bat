@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_14.txt del C:\result\Windows\export\W_14.txt

echo ================================================================
echo W-14: IIS ��ġ �� �⺻������ �����Ǵ� ���ʿ��� ���� ���� ���� ����
echo ================================================================

net start | find /I "llSADMIN" > C:\result\Windows\export\W_14.txt

type C:\result\Windows\export\W_14.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_14.txt) do (
    if %%~zA==0 (
    echo llS ���񽺰� ���� ������ �ʽ��ϴ�. >> C:\result\Windows\export\W_14.txt
	echo llS ���񽺰� ���� ������ �ʽ��ϴ�.
echo ================================================================
    ) else (
    echo llS ���񽺰� ���� ���Դϴ�. >> C:\result\Windows\export\W_14.txt
	echo llS ���񽺰� ���� ���Դϴ�.
echo ================================================================
    )
)

echo 1. �ش� �� ����Ʈ�� IIS Samples, IIS Help ���� ���丮�� �������� �ʴ� ���
echo 2. IIS�� ��ġ���� �ʾ��� ��
echo �� ���: ��ȣ
echo ================================================================
echo �ش� �� ����Ʈ�� IIS Samples, IIS Help ���� ���丮�� �����ϴ� ���
echo �� ��ġ �� ������ �Ӽ��� ��� ����Ʈ�� ������
echo �� ���: ���
echo ================================================================
echo �� ���� ���� 
echo W-14,���� >> C:\result\Windows\result.txt
echo ================================================================

pause