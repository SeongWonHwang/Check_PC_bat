@echo off

:: C:\result ������ �������� ������ ����
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-01: �������� �ֻ��� ������ ������ Administrator�� ������ ���� ���� ����
echo ================================================================

for /f "tokens=2 delims=," %%a in ('wmic useraccount where "SID like 'S-1-5-%%-500'" get name /format:csv') do (
    if not "%%a"=="Name" (
        set AdminName=%%a
    )
)

echo Administrator ���� �̸�: %AdminName%
echo Administrator ���� �̸�: %AdminName% > C:\result\Windows\export\W_01.txt
echo ================================================================

pause