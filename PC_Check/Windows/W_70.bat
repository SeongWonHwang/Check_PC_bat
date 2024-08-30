@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-70: 이벤트 로그 파일 용량 및 보관 기간 설정 점검
echo ================================================================

:: 초기 result 값을 1으로 설정
set result=1

:: MaxSizeValue 변수를 초기화
set MaxSizeValue=

:: 레지스트리 값을 쿼리하고 결과를 파일에 쓰기
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog\Application" > C:\result\Windows\export\W_70.txt 2>&1

:: MaxSize 값을 가져오기 (공백 제거)
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog\Application" /v "MaxSize" ^| findstr "MaxSize"') do (
    set MaxSizeValue=%%A
)

:: MaxSize 값을 KB 단위로 변환 (공백 및 기타 문자 제거)
for /f %%A in ("%MaxSizeValue%") do set /a MaxSizeDec=%%A/1024

echo 최대 로그 크기 값: %MaxSizeDec%KB
    
:: MaxSize 값이 설정되었는지 확인
if defined MaxSizeValue (
    if %MaxSizeDec% Lss 10240 (
        set result=0
    )
)

:: Retention 값을 가져오기 (공백 제거)
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog\Application" /v "Retention" ^| findstr "Retention"') do (
    set RetentionValue=%%A
)

if "%RetentionValue%" neq "0x0" (
    set result=0
echo 필요한 경우 이벤트 덮어쓰기 설정 안됨
) else (
echo 필요한 경우 이벤트 덮어쓰기 설정 됨
)

echo ================================================================

:: 결과 출력
if %result%==1 (
    echo W-70,만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 양호
) else (
    echo W-70,불만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 취약
)

echo ================================================================
pause