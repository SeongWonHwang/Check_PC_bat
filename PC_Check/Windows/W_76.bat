@echo off
:: C:\result 폴더가 존재하지 않으면 생성
if not exist C:\result\Windows mkdir C:\result\Windows\export

:: 기존 결과 파일을 삭제하여 중복 기록 방지
if exist C:\result\Windows\export\W_76.txt del C:\result\Windows\export\W_76.txt

echo ================================================================
echo W-76: 사용자 홈 디렉토리 권한 적절성 점검
echo ================================================================

echo 홈 디렉토리에 Everyone 권한이 없는 경우 (All Users, Default User 디렉토리 제외)
echo ※ 결과: 양호
echo ================================================================
echo 홈 디렉토리에 Everyone 권한이 있는 경우
echo ※ 결과: 취약
echo ================================================================
echo ※ 수동 점검 
echo W-76,보류 >> C:\result\Windows\result.txt
echo ================================================================

pause