@echo off
:: C:\result 폴더가 존재하지 않으면 생성
if not exist C:\result\Windows mkdir C:\result\Windows\export

:: 기존 결과 파일을 삭제하여 중복 기록 방지
if exist C:\result\Windows\export\W_64.txt del C:\result\Windows\export\W_64.txt

echo ================================================================
echo W-64: HTTP/FTP/SNMP 서비스 배너 차단 적용 여부 점검
echo ================================================================

echo HTTP, FTP, SMTP 접속 시 배너 정보가 보이지 않는 경우
echo ※ 결과: 양호
echo ================================================================
echo HTTP, FTP, SMTP 접속 시 배너 정보가 보여지는 경우
echo ※ 결과: 취약
echo ================================================================
echo ※ 수동 점검 
echo W-64,보류 >> C:\result\Windows\result.txt
echo ================================================================

pause