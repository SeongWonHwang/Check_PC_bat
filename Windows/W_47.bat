@echo off

:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows
if not exist C:\result\Windows\export mkdir C:\result\Windows\export

echo ================================================================
echo W-47: ����� ���� ��� �Ⱓ ��å ���� ���� ����
echo ================================================================

REM Get the lockout duration value
net accounts | find "��� �Ⱓ (��)" > C:\result\Windows\export\W_47_temp1.txt
for /f "tokens=4" %%a in (C:\result\Windows\export\W_47_temp1.txt) do set LockoutDuration=%%a

REM Get the observation window value
net accounts | find "��� ���� â (��)" > C:\result\Windows\export\W_47_temp2.txt
for /f "tokens=5" %%b in (C:\result\Windows\export\W_47_temp2.txt) do set ObservationWindow=%%b

echo ���� ��� �Ⱓ:                                           %LockoutDuration%
echo ���� �ð� �� ���� ��� ���� ������� ����:                %ObservationWindow%

echo ================================================================

REM Check both values to determine the result

if %LockoutDuration% GEQ 60 ( 
    if %ObservationWindow% GEQ 60 (
        echo �� ��� : ��ȣ
        echo W-47,���� >> C:\result\Windows\result.txt
    ) else (
        echo �� ��� : ���
        echo W-47,�Ҹ��� >> C:\result\Windows\result.txt
    )
) else (
    echo �� ��� : ���
    echo W-47,�Ҹ��� >> C:\result\Windows\result.txt
)
echo ================================================================

del C:\result\Windows\export\W_47_temp1.txt
del C:\result\Windows\export\W_47_temp2.txt
pause