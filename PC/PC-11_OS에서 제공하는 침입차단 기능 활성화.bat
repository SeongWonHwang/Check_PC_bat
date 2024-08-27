@echo off
:: C:\result 폴더가 존재하지 않으면 생성
if not exist C:\result\PC mkdir C:\result\PC\export

echo ================================================================
echo PC-11: 시스템의 방화벽 기능이 활성화되어 있는지 점검
echo ================================================================

:: 초기 result 값을 취약으로 설정
set result=취약

:: EnableFirewallValue 변수를 초기화
set EnableFirewallValue=

:: 레지스트리 값 가져오기
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" > C:\result\PC\export\PC_11.txt 2>&1

:: EnableFirewall 값 가져오기
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v "EnableFirewall" ^| findstr "EnableFirewall"') do set EnableFirewallValue=%%A

:: EnableFirewall 값이 설정되지 않을 경우 처리
if not defined EnableFirewallValue (
    echo 레지스트리 키가 존재하지 않음 >> C:\result\PC\result.txt
    echo 방화벽 설정 없음
    echo ================================================================
    echo ※ 결과 : 취약
    goto End
)

:: EnableFirewall 값 확인 및 결과 설정
if "%EnableFirewallValue%"=="0x1" (
    set result=양호
)

echo ================================================================

:: 결과 출력
if "%result%"=="취약" (
    echo PC-11,불만족 >> C:\result\PC\result.txt
    echo Windows Defender 방화벽 사용: 사용 안 함
    echo ================================================================
    echo ※ 결과 : 취약
) else (
    echo PC-11,만족 >> C:\result\PC\result.txt
    echo Windows Defender 방화벽 사용: 사용
    echo ================================================================
    echo ※ 결과 : 양호
)

:End
echo ================================================================
pause