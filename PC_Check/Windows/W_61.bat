@echo off
:: C:\result 폴더가 존재하지 않으면 생성
if not exist C:\result\Windows mkdir C:\result\Windows\export

:: 기존 결과 파일을 삭제하여 중복 기록 방지
if exist C:\result\Windows\export\W_61.txt del C:\result\Windows\export\W_61.txt

echo ================================================================
echo W-61: SNMP 서비스 커뮤니티 스트링(Community String) 적절성 점검
echo ================================================================

sc query "SNMPTRAP" | find "RUNNING" >nul
if %ERRORLEVEL%==0 (
    echo SNMP 서비스가 실행 중입니다.
echo ================================================================
) else (
    echo SNMP 서비스가 실행 중이지 않습니다.
echo ================================================================
)

echo SNMP 서비스를 사용하지 않거나 Community 이름이 public, private이 아닌 경우 (유추 가능한 값 사용 시 권고)
echo ※ 결과: 양호
echo ================================================================
echo 1. SNMP 서비스를 사용하며, Community 이름이 public, private인 경우
echo 2. SNMP 서비스를 사용하지 않으나 포트(161)가 열려 있는 경우
echo ※ 결과: 취약
echo ================================================================
echo ※ 수동 점검 
echo W-61,보류 >> C:\result\Windows\result.txt
echo ================================================================

pause