@echo off
:: C:\result ������ �������� ������ ����.
if not exist C:\result\Windows mkdir C:\result\Windows\export

:: ���� ��� ������ �����Ͽ� �ߺ� ��� ����
if exist C:\result\Windows\export\W_57.txt del C:\result\Windows\export\W_57.txt

echo ================================================================
echo W-57:  �����͹̳� ����� �׷� �� ���ΰ��� ���� ���� ����
echo ================================================================

net start | find /I "Remote Desktop Services" > C:\result\Windows\export\W_57.txt

type C:\result\Windows\export\W_57.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_57.txt) do (
    if %%~zA==0 (
        echo W-57,���� >> C:\result\Windows\result.txt
 echo ���� ����ũ�� ���񽺰� ���� ������ �ʽ��ϴ�.
echo ================================================================
        echo �� ��� : ��ȣ
    ) else (
        echo W-57,�Ҹ��� >> C:\result\Windows\result.txt
        echo ���� �͹̳� ���� ��� �� ��� ���� ���� ����
echo ���� ����ũ�� ���񽺰� ���� ���Դϴ�.
echo ================================================================
        echo �� ��� : ���
    )
)
echo ================================================================
pause