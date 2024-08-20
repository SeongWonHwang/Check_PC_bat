@echo off

:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows
if not exist C:\result\Windows\export mkdir C:\result\Windows\export

echo ================================================================
echo W-47: 사용자 계정 잠금 기간 정책 설정 여부 점검
echo ================================================================

REM Get the lockout duration value
net accounts | find "잠금 기간 (분)" > C:\result\Windows\export\W_47_temp1.txt
for /f "tokens=4" %%a in (C:\result\Windows\export\W_47_temp1.txt) do set LockoutDuration=%%a

REM Get the observation window value
net accounts | find "잠금 관찰 창 (분)" > C:\result\Windows\export\W_47_temp2.txt
for /f "tokens=5" %%b in (C:\result\Windows\export\W_47_temp2.txt) do set ObservationWindow=%%b

echo 계정 잠금 기간:                                           %LockoutDuration%
echo 다음 시간 후 계정 잠금 수를 원래대로 설정:                %ObservationWindow%

echo ================================================================

REM Check both values to determine the result

if %LockoutDuration% GEQ 60 ( 
    if %ObservationWindow% GEQ 60 (
        echo ※ 결과 : 양호
        echo W-47,만족 >> C:\result\Windows\result.txt
    ) else (
        echo ※ 결과 : 취약
        echo W-47,불만족 >> C:\result\Windows\result.txt
    )
) else (
    echo ※ 결과 : 취약
    echo W-47,불만족 >> C:\result\Windows\result.txt
)
echo ================================================================

del C:\result\Windows\export\W_47_temp1.txt
del C:\result\Windows\export\W_47_temp2.txt
pause