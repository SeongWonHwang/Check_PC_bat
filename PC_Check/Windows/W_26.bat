@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_26.txt del C:\result\Windows\export\W_26.txt

:: ���� ��� ������ �����Ͽ� �ߺ� ��� ����
if exist C:\result\Windows\export\W_26.txt del C:\result\Windows\export\W_26.txt

echo ================================================================
echo W-26: FTP Ȩ���丮�� ���� ���� ������ ����
echo ================================================================

net start | find /I "FTP Publishing Service" >> C:\result\Windows\export\W_26.txt
net start | find /I "Microsoft FTP Service" >> C:\result\Windows\export\W_26.txt

type C:\result\Windows\export\W_26.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_26.txt) do (
    if %%~zA==0 (
    echo FTP ���񽺰� ���� ������ �ʽ��ϴ�.
echo ================================================================
    ) else (
    echo FTP ���񽺰� ���� ���Դϴ�.
echo ================================================================
    )
)

echo 1. FTP ���񽺸� ������� �ʰų�, FTP Ȩ ���丮�� Everyone ������ ���� ���
echo 2. ��� FTP ������� ���丮 ���ٱ��� Ȯ���� �Ұ��� ��� n/a
echo �� ���: ��ȣ
echo ================================================================
echo FTP Ȩ ���丮�� Everyone ������ �ִ� ���
echo �� ���: ���
echo ================================================================
echo �� ���� ���� 
echo W-26,���� >> C:\result\Windows\result.txt
echo ================================================================

pause