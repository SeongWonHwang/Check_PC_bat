@echo off

:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-06: 관리자 그룹에 불필요한 사용자의 포함 여부 점검
echo ================================================================
 
net localgroup administrators | findstr /v /c:"명령을 잘 실행했습니다" > C:\result\Windows\export\W_06.txt

type C:\result\Windows\export\W_06.txt

echo ================================================================
echo 구성원 목록에
echo Administrator
echo PC 계정
echo 위 계정만 존재 시:              ※ 결과 : 양호
echo 외의 다른 불필요한 계정 존재시: ※ 결과 : 취약
echo ================================================================

pause