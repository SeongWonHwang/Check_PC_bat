@echo off
:: C:\result ������ �������� ������ ����
if not exist C:\result\PC mkdir C:\result\PC\export

if exist C:\result\PC\export\PC_16.txt del C:\result\PC\export\PC_16.txt

echo ================================================================
echo PC-16: �ϵ� ��ũ�� ���� �ý����� NTFS�� ����ϰ� �ִ� ���� ����
echo ================================================================

wmic logicaldisk get deviceid, filesystem
wmic logicaldisk get deviceid, filesystem | findstr /R /V "^$" > C:\result\PC\export\PC_16.txt 2>&1

echo ================================================================
findstr /I "FAT32" C:\result\PC\export\PC_16.txt > nul
if %errorlevel%==0 (
    echo FAT32 ���� �ý����� ������
    echo ================================================================
    echo �� ��� : ���
    echo PC-16,�Ҹ��� >> C:\result\PC\result.txt
) else (
    echo FAT32 ���� �ý����� �������� ����
    echo ================================================================
    echo �� ��� : ��ȣ
    echo PC-16,���� >> C:\result\PC\result.txt
)
echo ================================================================

pause