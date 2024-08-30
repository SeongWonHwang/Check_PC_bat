@echo off
:: C:\result 폴더가 존재하지 않으면 생성
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_79.txt del C:\result\Windows\export\W_79.txt

echo ================================================================
echo Windows-79: 하드 디스크의 파일 시스템이 NTFS를 사용하고 있는 지를 점검
echo ================================================================

wmic logicaldisk get deviceid, filesystem
wmic logicaldisk get deviceid, filesystem | findstr /R /V "^$" > C:\result\Windows\export\W_79.txt 2>&1

echo ================================================================
findstr /I "FAT32" C:\result\Windows\export\W_79.txt > nul
if %errorlevel%==0 (
    echo FAT32 파일 시스템이 존재함
    echo ================================================================
    echo ※ 결과 : 취약
    echo W-79,불만족 >> C:\result\Windows\result.txt
) else (
    echo FAT32 파일 시스템이 존재하지 않음
    echo ================================================================
    echo ※ 결과 : 양호
    echo W-79,만족 >> C:\result\Windows\result.txt
)
echo ================================================================

pause