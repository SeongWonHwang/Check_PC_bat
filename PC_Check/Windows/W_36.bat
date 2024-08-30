@echo off
:: C:\result 폴더가 존재하지 않으면 생성
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_36.txt del C:\result\Windows\export\W_36.txt

echo ================================================================
echo W-36: 시스템 내 백신 프로그램 설치 여부 점검
echo ================================================================

echo 바이러스 백신 프로그램이 설치되어 있는 경우
echo ※ 결과: 양호
echo ================================================================
echo 바이러스 백신 프로그램이 설치되어 있지 않은 경우
echo ※ 결과: 취약
echo ================================================================
echo ※ 수동 점검 
echo W-36,보류 >> C:\result\Windows\result.txt

echo ================================================================

pause