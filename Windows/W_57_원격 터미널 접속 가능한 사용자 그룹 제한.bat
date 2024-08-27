@echo off
:: C:\result 폴더가 존재하지 않으면 생성.
if not exist C:\result\Windows mkdir C:\result\Windows\export

:: 기존 결과 파일을 삭제하여 중복 기록 방지
if exist C:\result\Windows\export\W_57.txt del C:\result\Windows\export\W_57.txt

echo ================================================================
echo W-57:  원격터미널 사용자 그룹 내 비인가자 포함 여부 점검
echo ================================================================

net start | find /I "Remote Desktop Services" > C:\result\Windows\export\W_57.txt

type C:\result\Windows\export\W_57.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_57.txt) do (
    if %%~zA==0 (
        echo W-57,만족 >> C:\result\Windows\result.txt
 echo 원격 데스크톱 서비스가 실행 중이지 않습니다.
echo ================================================================
        echo ※ 결과 : 양호
    ) else (
        echo W-57,불만족 >> C:\result\Windows\result.txt
        echo 원격 터미널 서비스 사용 시 사용 계정 별도 점검
echo 원격 데스크톱 서비스가 실행 중입니다.
echo ================================================================
        echo ※ 결과 : 취약
    )
)
echo ================================================================
pause