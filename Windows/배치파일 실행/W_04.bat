@echo off

:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-04: ���� ��� �Ӱ谪�� ���� ���� ����
echo ================================================================

REM Get the lockout threshold value
net accounts | find "��� �Ӱ谪" > C:\result\Windows\export\W_04.txt
for /f "tokens=3" %%a in (C:\result\Windows\export\W_04.txt) do set W_04=%%a
type C:\result\Windows\export\W_04.txt

echo ================================================================

if %W_04% GEQ 1 if %W_04% LEQ 5  (
    echo �� ��� : ��ȣ
    echo W-04,�Ҹ��� >> C:\result\Windows\result.txt
    goto W4
)

echo �� ��� : ���
echo W-04,���� >> C:\result\Windows\result.txt
echo ================================================================
:W4

pause