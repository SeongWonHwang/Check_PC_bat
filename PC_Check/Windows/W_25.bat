@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

:: ���� ��� ������ �����Ͽ� �ߺ� ��� ����
if exist C:\result\Windows\export\W_25.txt del C:\result\Windows\export\W_25.txt

echo ================================================================
echo W-25: �ý��� �� FTP ���� ���� ���� ����
echo ================================================================

net start | find /I "FTP Publishing Service" >> C:\result\Windows\export\W_25.txt
net start | find /I "Microsoft FTP Service" >> C:\result\Windows\export\W_25.txt

type C:\result\Windows\export\W_25.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_25.txt) do (
    if %%~zA==0 (
    echo FTP ���񽺰� ���� ������ �ʽ��ϴ�.
echo ================================================================
        echo W-25,���� >> C:\result\Windows\result.txt
        echo �� ��� : ��ȣ
    ) else (
    echo FTP ���񽺰� ���� ���Դϴ�.
echo ================================================================
        echo W-25,�Ҹ��� >> C:\result\Windows\result.txt
        echo �� ��� : ���
    )
)
echo ================================================================
pause