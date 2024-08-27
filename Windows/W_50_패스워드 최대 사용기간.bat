@echo off

:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows
if not exist C:\result\Windows\export mkdir C:\result\Windows\export

echo ================================================================
echo W-50: 패스워드 최대 사용 기간 정책의 설정 여부 점검
echo ================================================================

:: 최대 암호 사용 기간을 CMD 창에 출력하고, C:\result\Windows\export\W_50.txt 파일로 기록
net accounts | find "최대 암호 사용 기간"
net accounts | find "Maximum password age"
net accounts | find "최대 암호 사용 기간" > C:\result\Windows\export\W_50.txt

for /f "tokens=6" %%a in (C:\result\Windows\export\W_50.txt) do set W_50=%%a
echo ================================================================

if %W_50% GTR 90 (
    echo ※ 결과 : 취약
    echo W-50,불만족 >> C:\result\Windows\result.txt
    goto W50
)

echo ※ 결과 : 양호
echo W-50,만족 >> C:\result\Windows\result.txt
echo ================================================================
:W50
pause