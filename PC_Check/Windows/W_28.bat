@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_28.txt del C:\result\Windows\export\W_28.txt

:: ���� ��� ������ �����Ͽ� �ߺ� ��� ����
if exist C:\result\Windows\export\W_28.txt del C:\result\Windows\export\W_28.txt

echo ================================================================
echo W-28: FTP ���� ������ IP �ּ� ���� ���� ����
echo ================================================================

net start | find /I "FTP Publishing Service" >> C:\result\Windows\export\W_28.txt
net start | find /I "Microsoft FTP Service" >> C:\result\Windows\export\W_28.txt

type C:\result\Windows\export\W_28.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_28.txt) do (
    if %%~zA==0 (
    echo FTP ���񽺰� ���� ������ �ʽ��ϴ�.
echo ================================================================
    ) else (
    echo FTP ���񽺰� ���� ���Դϴ�.
echo ================================================================
    )
)

echo 1. FTP ���񽺸� ������� �ʰų�, Ư�� IP �ּҿ����� FTP ������ �����ϵ��� �������� ������ ������ ���
echo 2. ��� FTP ������� ���� ���� Ȯ���� �Ұ��� ��� n/a
echo �� ���: ��ȣ
echo ================================================================
echo Ư�� IP �ּҿ����� FTP ������ �����ϵ��� �������� ������ �������� ���� ���
echo �� ��ġ �� ������ �Ӽ��� ��� ����Ʈ�� ������
echo �� ���: ���
echo ================================================================
echo �� ���� ���� 
echo W-28,���� >> C:\result\Windows\result.txt
echo ================================================================

pause