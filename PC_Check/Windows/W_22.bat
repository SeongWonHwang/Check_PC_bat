@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_22.txt del C:\result\Windows\export\W_22.txt

echo ================================================================
echo W-22: IIS Exec ��ɾ� �� ȣ�� ����
echo ================================================================

net start | find /I "llSADMIN" > C:\result\Windows\export\W_22.txt

type C:\result\Windows\export\W_22.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_22.txt) do (
    if %%~zA==0 (
    echo llS ���񽺰� ���� ������ �ʽ��ϴ�. >> C:\result\Windows\export\W_22.txt
	echo llS ���񽺰� ���� ������ �ʽ��ϴ�.
echo ================================================================
    ) else (
    echo llS ���񽺰� ���� ���Դϴ�. >> C:\result\Windows\export\W_22.txt
	echo llS ���񽺰� ���� ���Դϴ�.
echo ================================================================
    )
)

echo IIS 5.0 �������� �ش� ������Ʈ�� ���� 0�̰ų�, IIS 6.0 ���� �̻��� ���
echo IIS�� ��ġ���� �ʾ��� ��
echo �� ���: ��ȣ
echo ================================================================
echo IIS 5.0 �������� �ش� ������Ʈ�� ���� 1�� ���
echo �� ���: ���
echo ================================================================
echo �� ���� ���� 
echo W-22,���� >> C:\result\Windows\result.txt
echo ================================================================

pause