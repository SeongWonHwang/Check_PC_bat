@echo off

:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-04: 계정 잠금 임계값의 설정 여부 점검
echo ================================================================

REM Get the lockout threshold value
net accounts | find "잠금 임계값" > C:\result\Windows\export\W_04.txt
for /f "tokens=3" %%a in (C:\result\Windows\export\W_04.txt) do set W_04=%%a
type C:\result\Windows\export\W_04.txt

echo ================================================================

if %W_04% GEQ 1 if %W_04% LEQ 5  (
    echo ※ 결과 : 양호
    echo W-04,불만족 >> C:\result\Windows\result.txt
    goto W4
)

echo ※ 결과 : 취약
echo W-04,만족 >> C:\result\Windows\result.txt
echo ================================================================
:W4

pause