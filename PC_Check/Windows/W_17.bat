@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_17.txt del C:\result\Windows\export\W_17.txt
echo ================================================================
echo W-17: IIS ���� ���ε� �� �ٿ�ε� ���� ���� ���� ����
echo ================================================================

net start | find /I "llSADMIN" > C:\result\Windows\export\W_17.txt

type C:\result\Windows\export\W_17.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_17.txt) do (
    if %%~zA==0 (
    echo llS ���񽺰� ���� ������ �ʽ��ϴ�. >> C:\result\Windows\export\W_17.txt
	echo llS ���񽺰� ���� ������ �ʽ��ϴ�.
echo ================================================================
    ) else (
    echo llS ���񽺰� ���� ���Դϴ�. >> C:\result\Windows\export\W_17.txt
	echo llS ���񽺰� ���� ���Դϴ�.
echo ================================================================
    )
)

echo 1. �� ���μ����� ���� �ڿ� ������ ���� ���ε� �� �ٿ�ε� �뷮�� �����ϴ� ���
echo 2. ���ε�, �ٿ�ε� ���� ����� ���� ���
echo 3. IIS�� ��ġ���� �ʾ��� ��
echo �� ���: ��ȣ
echo ================================================================
echo �� ���μ����� ���� �ڿ��� �������� �ʴ� ���(���ε� �� �ٿ�ε� �뷮 �� ����)
echo �� ���: ���
echo ================================================================
echo �� ���� ���� 
echo W-17,���� >> C:\result\Windows\result.txt
echo ================================================================

pause