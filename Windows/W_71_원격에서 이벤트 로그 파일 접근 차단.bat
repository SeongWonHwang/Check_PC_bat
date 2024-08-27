@echo off

:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-71: 원격에서 로그 파일의 접근을 차단하기 위한 권한 적절성 점검
echo ================================================================

REM Get and display all user accounts without the header, separator, empty lines, and unnecessary messages
icacls %systemroot%\system32\config | find /v "파일을 처리했으며" > C:\result\Windows\export\W_71.txt

echo 현재 사용자 계정:
type C:\result\Windows\export\W_71.txt

echo ================================================================
echo Everyone 권한이 있는 경우 ※ 결과 : 취약
echo Everyone 권한이 없는 경우 ※ 결과 : 양호
echo ================================================================

pause