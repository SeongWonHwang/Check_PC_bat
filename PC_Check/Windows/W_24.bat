@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_24.txt del C:\result\Windows\export\W_24.txt

echo ================================================================
echo W-24: NetBIOS ���ε� ���� ���� ���� ����
echo ================================================================

nbtstat -n | find /I "NetBIOS" > C:\result\Windows\export\W_24.txt

ipconfig /all
echo ================================================================

for %%A in (C:\result\Windows\export\W_24.txt) do (
    if %%~zA==0 (
        echo W-24,���� >> C:\result\Windows\result.txt
        echo �� ��� : ��ȣ
    ) else (
        echo W-24,�Ҹ��� >> C:\result\Windows\result.txt
        echo �� ��� : ���
    )
)
echo ================================================================

pause