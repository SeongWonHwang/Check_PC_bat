@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_23.txt del C:\result\Windows\export\W_23.txt

echo ================================================================
echo W-23: IIS WebDAV ��Ȱ��ȭ ���� ����
echo ================================================================

net start | find /I "llSADMIN" > C:\result\Windows\export\W_23.txt

type C:\result\Windows\export\W_23.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_23.txt) do (
    if %%~zA==0 (
    echo llS ���񽺰� ���� ������ �ʽ��ϴ�. >> C:\result\Windows\export\W_23.txt
	echo llS ���񽺰� ���� ������ �ʽ��ϴ�.
echo ================================================================
    ) else (
    echo llS ���񽺰� ���� ���Դϴ�. >> C:\result\Windows\export\W_23.txt
	echo llS ���񽺰� ���� ���Դϴ�.
echo ================================================================
    )
)

echo ���� �� �� ������ �ش��ϴ� ���
echo 1. IIS ���񽺸� ������� �ʴ� ���
echo 2. DisableWebDAV ���� 1�� �����Ǿ� �ִ� ���
echo 3. Windows NT, 2000�� ������ 4 �̻��� ��ġ�Ǿ� �ִ� ���
echo 4. Windows 2003, 2008, 2012, 2016, 2019�� WebDAV�� ���� �Ǿ� �ִ� ���
echo 5. IIS�� ��ġ���� �ʾ��� ��
echo �� ���: ��ȣ
echo ================================================================
echo ��ȣ ���ؿ� �� ������ �ش����� �ʴ� ���(2003, 2008, 2012, 2016, 2019�� 1,4����)
echo �� ���: ���
echo ================================================================
echo �� ���� ���� 
echo W-23,���� >> C:\result\Windows\result.txt
echo ================================================================

pause