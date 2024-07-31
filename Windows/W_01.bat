@echo off

:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-01: 윈도우즈 최상위 관리자 계정인 Administrator의 계정명 변경 여부 점검
echo ================================================================

REM Get the name of the Administrator account
for /f "tokens=2 delims=," %%a in ('wmic useraccount where "SID like 'S-1-5-%%-500'" get name /format:csv') do (
    if not "%%a"=="Name" (
        set AdminName=%%a
    )
)

echo Administrator 계정 이름: %AdminName%
echo Administrator 계정 이름: %AdminName% > C:\result\Windows\export\W_01.txt
echo ================================================================

pause