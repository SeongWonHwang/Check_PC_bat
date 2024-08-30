@echo off

:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-03: 시스템 내 불필요한 계정 및 의심스러운 계정의 존재 여부를 점검
echo ================================================================

:: 유저 출력
net user | findstr /v /c:"사용자 계정" | findstr /v /c:"---" | findstr /v /c:"명령을 잘 실행했습니다" | findstr /r /v "^$" > C:\result\Windows\export\W_03.txt

echo 현재 사용자 계정:
type C:\result\Windows\export\W_03.txt

echo ================================================================
echo Administrator
echo PC 계정
echo castle
echo OPER
echo Guest
echo ================================================================
echo 위 계정만 존재 시             : ※ 결과 : 양호
echo 외의 다른 불필요한 계정 존재시: ※ 결과 : 취약
echo ================================================================
echo ※ 수동 점검
echo W-03,보류 >> C:\result\Windows\result.txt
echo ================================================================

pause