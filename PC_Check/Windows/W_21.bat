@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_21.txt del C:\result\Windows\export\W_21.txt

echo ================================================================
echo W-21: IIS �̻�� ��ũ��Ʈ ���� ����
echo ================================================================

net start | find /I "llSADMIN" > C:\result\Windows\export\W_21.txt

type C:\result\Windows\export\W_21.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_21.txt) do (
    if %%~zA==0 (
    echo llS ���񽺰� ���� ������ �ʽ��ϴ�. >> C:\result\Windows\export\W_21.txt
	echo llS ���񽺰� ���� ������ �ʽ��ϴ�.
echo ================================================================
    ) else (
    echo llS ���񽺰� ���� ���Դϴ�. >> C:\result\Windows\export\W_21.txt
	echo llS ���񽺰� ���� ���Դϴ�.
echo ================================================================
    )
)

echo 1. ����� ����(.htr .idc .stm .shtm .shtml .printer .htw .ida .idq)�� �������� �ʴ� ���
echo 2. IIS�� ��ġ���� �ʾ��� ��
echo �� ���: ��ȣ
echo ================================================================
echo ����� ����(.htr .idc .stm .shtm .shtml .printer .htw .ida .idq)�� �����ϴ� ���
echo �� ��ġ �� ������ �Ӽ��� ��� ����Ʈ�� ������
echo �� ���: ���
echo ================================================================
echo �� ���� ���� 
echo W-21,���� >> C:\result\Windows\result.txt
echo ================================================================

pause