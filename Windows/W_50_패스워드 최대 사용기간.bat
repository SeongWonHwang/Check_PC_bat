@echo off

:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows
if not exist C:\result\Windows\export mkdir C:\result\Windows\export

echo ================================================================
echo W-50: �н����� �ִ� ��� �Ⱓ ��å�� ���� ���� ����
echo ================================================================

:: �ִ� ��ȣ ��� �Ⱓ�� CMD â�� ����ϰ�, C:\result\Windows\export\W_50.txt ���Ϸ� ���
net accounts | find "�ִ� ��ȣ ��� �Ⱓ"
net accounts | find "Maximum password age"
net accounts | find "�ִ� ��ȣ ��� �Ⱓ" > C:\result\Windows\export\W_50.txt

for /f "tokens=6" %%a in (C:\result\Windows\export\W_50.txt) do set W_50=%%a
echo ================================================================

if %W_50% GTR 90 (
    echo �� ��� : ���
    echo W-50,�Ҹ��� >> C:\result\Windows\result.txt
    goto W50
)

echo �� ��� : ��ȣ
echo W-50,���� >> C:\result\Windows\result.txt
echo ================================================================
:W50
pause