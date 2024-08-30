@echo off

:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-78: 보안 채널 데이터 디지털 암호화 또는 서명’ 정책 적절성 점검
echo ================================================================

:: 초기 result 값을 취약으로 설정
set result=취약
set use=사용 안함

reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" > C:\result\Windows\export\W_78.txt 2>&1

:: 레지스트리 값을 쿼리하고 변수에 할당
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" /v "RequireSignOrSeal" ^| findstr "RequireSignOrSeal"') do (
    set RequireSignOrSealValue=%%A
)

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" /v "SealSecureChannel" ^| findstr "SealSecureChannel"') do (
    set SealSecureChannelValue=%%A
)

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" /v "SignSecureChannel" ^| findstr "SignSecureChannel"') do (
    set SignSecureChannelValue=%%A
)
    
if defined RequireSignOrSealValue if "%RequireSignOrSealValue%" equ "0x1" (
    if defined SignSecureChannelValue if "%SignSecureChannelValue%" equ "0x1" (
        if defined SealSecureChannelValue if "%SealSecureChannelValue%" equ "0x1" (            
                set result=양호
set use=사용				
        )
    )
)

echo 도메인 구성원: 보안 채널 데이터를 디지털 서명: %use%
echo 도메인 구성원: 보안 채널 데이터를 디지털 암호화 또는 서명: %use%
echo 도메인 구성원: 보안 채널 데이터를 디지털 암호화: %use%

echo ================================================================

:: 결과 출력
if %result%==취약 (
    echo W-78,불만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 취약
) else (
    echo W-78,불만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 양호
)

echo ================================================================
pause