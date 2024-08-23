@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-67: 원격터미널 접속 타임아웃 설정 여부 점검
echo ================================================================

:: 초기 result 값을 1으로 설정 (양호)
set result=1

:: MaxIdleTimeValue 변수를 초기화합니다.
set MaxIdleTimeValue=

:: 레지스트리 값을 쿼리하고 결과를 파일에 쓰기
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" > C:\result\Windows\export\W_67.txt 2>&1

:: MaxIdleTime 값을 가져오기
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "MaxIdleTime" ^| findstr "MaxIdleTime"') do set MaxIdleTimeValue=%%A

set /a MaxIdleTimeDec=%MaxIdleTimeValue%/60000

echo MaxIdleTime 값: %MaxIdleTimeDec%분
    
:: MaxIdleTime 값이 설정되었는지 확인
if defined MaxIdleTimeValue (

    
    if not "%MaxIdleTimeDec%" GEQ "1800000" (
        set result=0
    )
)


echo ================================================================

:: 결과 출력
if %result%==1 (
    echo W-67,만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 양호
) else (
    echo W-67,불만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 취약
)

echo ================================================================
pause