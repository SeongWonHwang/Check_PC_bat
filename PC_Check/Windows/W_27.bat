@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_27.txt del C:\result\Windows\export\W_27.txt

:: ���� ��� ������ �����Ͽ� �ߺ� ��� ����
if exist C:\result\Windows\export\W_27.txt del C:\result\Windows\export\W_27.txt

echo ================================================================
echo W-27: FTP ������ Anonymous(�͸�) ���� ��� ���� ����
echo ================================================================

net start | find /I "FTP Publishing Service" >> C:\result\Windows\export\W_27.txt
net start | find /I "Microsoft FTP Service" >> C:\result\Windows\export\W_27.txt

type C:\result\Windows\export\W_27.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_27.txt) do (
    if %%~zA==0 (
    echo FTP ���񽺰� ���� ������ �ʽ��ϴ�.
echo ================================================================
    ) else (
    echo FTP ���񽺰� ���� ���Դϴ�.
echo ================================================================
    )
)

echo 1. FTP ���񽺸� ������� �ʰų�, ���͸� ���� ��롱�� üũ���� ���� ���
echo 2. ��� FTP ������� �͸��� Ȯ���� �Ұ��� ��� n/a
echo �� ���: ��ȣ
echo ================================================================
echo FTP ���񽺸� ����ϰų�, ���͸� ���� ��롱�� üũ�Ǿ� �ִ� ���
echo �� ���: ���
echo ================================================================
echo �� ���� ���� 
echo W-27,���� >> C:\result\Windows\result.txt
echo ================================================================

pause