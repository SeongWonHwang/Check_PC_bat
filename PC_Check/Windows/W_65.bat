@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-65: Telnet ���� ���� ��Ȱ��ȭ �� ����� ���� ��� ���� ����
echo ================================================================

net start | find /I "Telnet" >> C:\result\Windows\export\W_65.txt

type C:\result\Windows\export\W_65.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_65.txt) do (
    if %%~zA==0 (
    echo Telnet ���񽺰� ���� ������ �ʽ��ϴ�.
echo ================================================================
        echo W-65,���� >> C:\result\Windows\result.txt
        echo �� ��� : ��ȣ
    ) else (
    echo Telnet ���񽺰� ���� ���Դϴ�.
echo ================================================================
        echo W-65,�Ҹ��� >> C:\result\Windows\result.txt
        echo ���� ���� �ʿ�
    )
)
echo ================================================================
pause