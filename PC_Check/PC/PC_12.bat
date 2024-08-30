@echo off
:: C:\result 폴더가 존재하지 않으면 생성
if not exist C:\result\PC mkdir C:\result\PC\export

if exist C:\result\PC\export\PC_12.txt del C:\result\PC\export\PC_12.txt

echo ================================================================
echo PC-12: 화면보호기 대기 시간 및 화면보호기 재시작 시 암호 설정 여부 점검
echo ================================================================

echo 화면 보호기 설정 (수동 점검) > C:\result\PC\export\PC_12.txt
echo 화면보호기 설정(대기시간 10분 이하) 및 암호로 보호가 설정되어 있는 경우     : ※ 결과: 양호
echo ================================================================
echo 화면보호기 설정(대기시간 10분 초과) 및 암호로 보호가 설정되어 있지 않은 경우: ※ 결과: 취약
echo ================================================================
echo ※ 수동 점검 
echo PC-12,보류 >> C:\result\PC\result.txt
echo ================================================================

pause