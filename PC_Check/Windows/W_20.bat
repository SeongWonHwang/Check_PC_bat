@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_20.txt del C:\result\Windows\export\W_20.txt

echo ================================================================
echo W-20: IIS ������ ���� ACL ���� ���� ����
echo ================================================================

net start | find /I "llSADMIN" > C:\result\Windows\export\W_20.txt

type C:\result\Windows\export\W_20.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_20.txt) do (
    if %%~zA==0 (
    echo llS ���񽺰� ���� ������ �ʽ��ϴ�. >> C:\result\Windows\export\W_20.txt
	echo llS ���񽺰� ���� ������ �ʽ��ϴ�.
echo ================================================================
    ) else (
    echo llS ���񽺰� ���� ���Դϴ�. >> C:\result\Windows\export\W_20.txt
	echo llS ���񽺰� ���� ���Դϴ�.
echo ================================================================
    )
)

echo 1. Ȩ ���丮 ���� �ִ� ���� ���ϵ鿡 ���� Everyone ������ �������� �ʴ� ��� (���� ������ ������ Read ���Ѹ�)
echo 2. IIS�� ��ġ���� �ʾ��� ��
echo �� ���: ��ȣ
echo ================================================================
echo Ȩ ���丮 ���� �ִ� ���� ���ϵ鿡 ���� Everyone ������ �����ϴ� ��� (���� ������ ������ Read ���� ����)
echo �� ��ġ �� ������ �Ӽ��� ��� ����Ʈ�� ������
echo �� ���: ���
echo ================================================================
echo �� ���� ���� 
echo W-20,���� >> C:\result\Windows\result.txt
echo ================================================================

pause