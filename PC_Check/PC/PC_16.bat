@echo off
:: C:\result 폴더가 존재하지 않으면 생성
if not exist C:\result\PC mkdir C:\result\PC\export

if exist C:\result\PC\export\PC_16.txt del C:\result\PC\export\PC_16.txt

echo ================================================================
echo PC-16: 하드 디스크의 파일 시스템이 NTFS를 사용하고 있는 지를 점검
echo ================================================================

wmic logicaldisk get deviceid, filesystem
wmic logicaldisk get deviceid, filesystem | findstr /R /V "^$" > C:\result\PC\export\PC_16.txt 2>&1

echo ================================================================
findstr /I "FAT32" C:\result\PC\export\PC_16.txt > nul
if %errorlevel%==0 (
    echo FAT32 파일 시스템이 존재함
    echo ================================================================
    echo ※ 결과 : 취약
    echo PC-16,불만족 >> C:\result\PC\result.txt
) else (
    echo FAT32 파일 시스템이 존재하지 않음
    echo ================================================================
    echo ※ 결과 : 양호
    echo PC-16,만족 >> C:\result\PC\result.txt
)
echo ================================================================

pause