@echo off
:: C:\result 폴더가 존재하지 않으면 생성
if not exist C:\result\Windows mkdir C:\result\Windows\export

:: 기존 결과 파일을 삭제하여 중복 기록 방지
if exist C:\result\Windows\export\W_57.txt del C:\result\Windows\export\W_57.txt

echo ================================================================
echo W-60: SNMP 서비스 구동 여부 점검
echo ================================================================

sc query "SNMPTRAP" | find "RUNNING" >nul
if %ERRORLEVEL%==0 (
    echo SNMP 서비스가 실행 중입니다.
echo ================================================================
 echo ※ 결과 : 취약
echo W-60,불만족 >> C:\result\Windows\result.txt
) else (
    echo SNMP 서비스가 실행 중이지 않습니다.
echo ================================================================
echo ※ 결과 : 양호
echo W-60,만족 >> C:\result\Windows\result.txt
)

echo ================================================================
echo W-60 ~ W-62 SNMP 서비스 사용 시 수동 점검
echo ================================================================
pause