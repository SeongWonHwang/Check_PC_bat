@echo off

:: C:\result 폴더가 존재하지 않으면 생성
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-01: 윈도우즈 최상위 관리자 계정인 Administrator의 계정명 변경 여부 점검
echo ================================================================

for /f "tokens=2 delims=," %%a in ('wmic useraccount where "SID like 'S-1-5-%%-500'" get name /format:csv') do (
    if not "%%a"=="Name" (
        set AdminName=%%a
    )
)

echo Administrator 계정 이름: %AdminName%
echo Administrator 계정 이름: %AdminName% > C:\result\Windows\export\W_01.txt

    echo ================================================================

if "%AdminName%"=="Administrator" (
echo Administrator 계정 이름을 변경 안 함
    echo ================================================================
    echo W-01,만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 취약
) else (
echo Administrator 계정 이름을 변경 함
    echo ================================================================
    echo W-01,불만족 >> C:\result\Windows\result.txt
	echo ※ 결과 : 양호
	
)

echo ================================================================

pause