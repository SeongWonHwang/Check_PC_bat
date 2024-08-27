@echo off

:: C:\result 폴더가 존재하지 않으면 생성
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-80: 컴퓨터 계정 암호 최대 사용 기간 설정 여부 점검
echo ================================================================

:: 초기 result 값을 취약으로 설정
set result=취약
set use=사용

reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" > C:\result\Windows\export\W_80.txt 2>&1

:: 레지스트리 값을 쿼리하고 변수에 할당
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" /v "DisablePasswordChange" ^| findstr "DisablePasswordChange"') do (
    set DisablePasswordChangeValue=%%A
)

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" /v "MaximumPasswordAge" ^| findstr "MaximumPasswordAge"') do (
    set MaximumPasswordAgeValue=%%A
)
set /a MaximumPasswordAgeDec=MaximumPasswordAgeValue
    
if defined DisablePasswordChangeValue if "%DisablePasswordChangeValue%" equ "0x0" (
    if defined MaximumPasswordAgeValue if "%MaximumPasswordAgeValue%" LEQ "0x5a" (   

                set result=양호
				set use=사용 안함			
    )
)

echo 도메인 구성원: 컴퓨터 계정 암호 변경 사용 안 함: %use%
echo 도메인 구성원: 컴퓨터 계정 암호 최대 사용 기간: %MaximumPasswordAgeDec%일

echo ================================================================

:: 결과 출력
if %result%==취약 (
    echo W-80,불만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 취약
) else (
    echo W-80,불만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 양호
)

echo ================================================================
pause