@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-10: ���ʿ��� IIS ���� ���� ���� ����
echo ================================================================

net start | find /I "llSADMIN" >> C:\result\Windows\export\W_10.txt

type C:\result\Windows\export\W_10.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_10.txt) do (
    if %%~zA==0 (
    echo llS ���񽺰� ���� ������ �ʽ��ϴ�.
echo ================================================================
        echo W-10,���� >> C:\result\Windows\result.txt
        echo �� ��� : ��ȣ
    ) else (
    echo llS ���񽺰� ���� ���Դϴ�.
echo ================================================================
        echo W-10,�Ҹ��� >> C:\result\Windows\result.txt
        echo �� ��� : ���
    )
)
echo ================================================================
pause