@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_15.txt del C:\result\Windows\export\W_15.txt
echo ================================================================
echo W-15: �� ���μ��� ���� ���� ���� ���� ����
echo ================================================================

net start | find /I "llSADMIN" > C:\result\Windows\export\W_15.txt

type C:\result\Windows\export\W_15.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_15.txt) do (
    if %%~zA==0 (
    echo llS ���񽺰� ���� ������ �ʽ��ϴ�. >> C:\result\Windows\export\W_15.txt
	echo llS ���񽺰� ���� ������ �ʽ��ϴ�.
echo ================================================================
    ) else (
    echo llS ���񽺰� ���� ���Դϴ�. >> C:\result\Windows\export\W_15.txt
	echo llS ���񽺰� ���� ���Դϴ�.
echo ================================================================
    )
)

echo 1. �� ���μ����� �� ���� ��� �ʿ��� �ּ��� �������� �����Ǿ� �ִ� ���
echo - IIS ���� ����(nobody)�� ����
echo - IIS ���� ����(nobody)�� �׷쿡 �ٸ� ���� ������
echo - ���񽺷� �α׿¿� IIS ���� ����(nobody) �߰�
echo - IIS ADMIN ������ �α׿� ���� ����(nobody)
echo 2. IIS�� ��ġ���� �ʾ��� ��
echo 3. 2008 R2(IIS 7.5) �̻��� ������ ������� ��
echo (�� IIS 7.5 �̻��� Default�� ApplicationPoolIdentity�� ����Ǿ� ��ȣ)
echo �� ���: ��ȣ
echo ================================================================
echo �� ���μ����� ������ ������ �ο��� �������� �����ǰ� �ִ� ���
echo �� ���: ���
echo ================================================================
echo �� ���� ���� 
echo W-15,���� >> C:\result\Windows\result.txt
echo ================================================================

pause