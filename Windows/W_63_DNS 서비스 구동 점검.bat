@echo off
:: C:\result ������ �������� ������ ����
if not exist C:\result\Windows mkdir C:\result\Windows\export

:: ���� ��� ������ �����Ͽ� �ߺ� ��� ����
if exist C:\result\Windows\export\W_63.txt del C:\result\Windows\export\W_63.txt

echo ================================================================
echo W-63: DNS ������ ���� ������Ʈ ���� ���� ����
echo ================================================================

:: ���� ���� ���� �� ��� ���
net start | find /I "DNS Client" >> C:\result\Windows\export\W_63.txt

type C:\result\Windows\export\W_63.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_63.txt) do (
    if %%~zA==0 (
        echo W-63,���� >> C:\result\Windows\result.txt
        echo �� ��� : ��ȣ
    ) else (
        echo W-63,�Ҹ��� >> C:\result\Windows\result.txt
        echo �� ��� : ���
    )
)
echo ================================================================
pause