@echo off
:: C:\result ������ �������� ������ ����
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_79.txt del C:\result\Windows\export\W_79.txt

echo ================================================================
echo Windows-79: �ϵ� ��ũ�� ���� �ý����� NTFS�� ����ϰ� �ִ� ���� ����
echo ================================================================

wmic logicaldisk get deviceid, filesystem
wmic logicaldisk get deviceid, filesystem | findstr /R /V "^$" > C:\result\Windows\export\W_79.txt 2>&1

echo ================================================================
findstr /I "FAT32" C:\result\Windows\export\W_79.txt > nul
if %errorlevel%==0 (
    echo FAT32 ���� �ý����� ������
    echo ================================================================
    echo �� ��� : ���
    echo W-79,�Ҹ��� >> C:\result\Windows\result.txt
) else (
    echo FAT32 ���� �ý����� �������� ����
    echo ================================================================
    echo �� ��� : ��ȣ
    echo W-79,���� >> C:\result\Windows\result.txt
)
echo ================================================================

pause