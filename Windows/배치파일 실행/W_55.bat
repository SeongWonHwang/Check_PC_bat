@echo off

:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-55: 최근 암호 기억 정책 설정 여부 점검
echo ================================================================

REM Get the lockout threshold value
net accounts | find "암호 기록 개수" > C:\result\Windows\export\W_55.txt
for /f "tokens=4" %%a in (C:\result\Windows\export\W_55.txt) do set W_55=%%a
type C:\result\Windows\export\W_55.txt

echo ================================================================

REM Check if the value is "없음" and determine the result
if /I "%W_55%"=="없음" (
    echo ※ 결과 : 취약
    echo W-55,불만족 >> C:\result\Windows\result.txt
    goto W4
)

if %W_55% GEQ 4 (
    echo ※ 결과 : 양호
    echo W-55,만족 >> C:\result\Windows\result.txt
    goto W4
)

echo ※ 결과 : 취약
echo W-55,불만족 >> C:\result\Windows\result.txt
echo ================================================================
:W4

pause