@echo off

:: C:\result ������ �������� ������ ����
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-55: �ֱ� ��ȣ ��� ��å ���� ���� ����
echo ================================================================

net accounts | find "��ȣ ��� ����" > C:\result\Windows\export\W_55.txt
for /f "tokens=4" %%a in (C:\result\Windows\export\W_55.txt) do set W_55=%%a
type C:\result\Windows\export\W_55.txt

echo ================================================================

if /I "%W_55%"=="����" (
    echo �� ��� : ���
    echo W-55,�Ҹ��� >> C:\result\Windows\result.txt
    goto W4
)

if %W_55% GEQ 4 (
    echo �� ��� : ��ȣ
    echo W-55,���� >> C:\result\Windows\result.txt
    goto W4
)

echo �� ��� : ���
echo W-55,�Ҹ��� >> C:\result\Windows\result.txt
echo ================================================================
:W4

pause