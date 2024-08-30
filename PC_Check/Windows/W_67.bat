@echo off
:: C:\result 폴더가 존재하지 않으면 생성
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-67: 원격터미널 접속 타임아웃 설정 여부 점검
echo ================================================================

:: 초기 result 값을 양호로 설정
set result=양호

:: MaxIdleTimeValue 변수를 초기화
set MaxIdleTimeValue=

:: 레지스트리 값을 쿼리하고 결과를 파일에 쓰기
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" > C:\result\Windows\export\W_67.txt 2>&1

:: MaxIdleTime 값을 가져오기
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "MaxIdleTime" 2^>nul ^| findstr "MaxIdleTime"') do set MaxIdleTimeValue=%%A

:: MaxIdleTime 값이 설정되지 않은 경우 처리
if not defined MaxIdleTimeValue (
	echo 활성 상태지만 유휴 터미널 서비스 세션에 시간 제한 설정: 구성되지 않음
	echo ================================================================
	echo W-67,불만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 취약
    goto End
)

:: MaxIdleTime 값이 정의된 경우에만 산술 연산 수행
set /a MaxIdleTimeDec=%MaxIdleTimeValue%/60000
echo MaxIdleTime 값: %MaxIdleTimeDec%분

if %MaxIdleTimeValue% GTR 1800000 (
    set result=취약
)

echo ================================================================

:: 결과 출력
if %result%==취약 (
    echo W-67,불만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 취약
) else (
    echo W-67,만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 양호
)

:End
echo ================================================================
pause