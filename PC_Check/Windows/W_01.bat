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

if "%AdminName%"=="Administrator" (
echo Administrator ���� �̸��� ���� �� ��
    echo ================================================================
    echo W-01,���� >> C:\result\Windows\result.txt
    echo �� ��� : ���
) else (
echo Administrator ���� �̸��� ���� ��
    echo ================================================================
    echo W-01,�Ҹ��� >> C:\result\Windows\result.txt
	echo �� ��� : ��ȣ
	
)

echo ================================================================

pause