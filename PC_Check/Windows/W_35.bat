@echo off
:: C:\result ������ �������� ������ ����
if not exist C:\result\Windows mkdir C:\result\Windows\export

:: ���� ��� ������ �����Ͽ� �ߺ� ��� ����
if exist C:\result\Windows\export\W_35.txt del C:\result\Windows\export\W_35.txt

echo ================================================================
echo W-35: ���� ������Ʈ�� ���� ��� ���� ����
echo ================================================================

:: ���񽺿��� Ȯ��
net start | find /I "Remote Registry Service" >> C:\result\Windows\export\W_35.txt

type C:\result\Windows\export\W_35.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_35.txt) do (
    if %%~zA==0 (
    echo ���� ������Ʈ�� ���񽺰� ���� ������ �ʽ��ϴ�.
echo ================================================================
        echo W-35,���� >> C:\result\Windows\result.txt
        echo �� ��� : ��ȣ
    ) else (
    echo ���� ������Ʈ�� ���񽺰� ���� ���Դϴ�.
echo ================================================================
        echo W-35,�Ҹ��� >> C:\result\Windows\result.txt
        echo �� ��� : ���
    )
)
echo ================================================================
pause