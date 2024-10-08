@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_81.txt del C:\result\Windows\export\W_81.txt
echo ================================================================
echo W-81: 시작프로그램 목록 내 불필요한 항목 존재 여부 점검
echo ================================================================

echo 시작프로그램 목록을 정기적으로 검사하고 불필요한 서비스 체크 해제 하고, 관련 서비스를 중지 한 경우
echo ※ 결과: 양호
echo ================================================================
echo 시작프로그램 목록을 정기적으로 검사하지 않고, 부팅 시 불필요한 서비스도 실행되고 있는 경우
echo 제어시스템 특성상 불필요한 업데이트 및 응용프로그램이 실행되고 있는 경우
echo ※ 결과: 취약
echo ================================================================
echo ※ 수동 점검 
echo W-81,보류 >> C:\result\Windows\result.txt
echo ================================================================

pause