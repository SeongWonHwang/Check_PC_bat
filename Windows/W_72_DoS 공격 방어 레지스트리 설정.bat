@echo off

:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-72: DoS 공격 방어 레지스트리 설정 여부 점검
echo ================================================================

:: 초기 result 값을 취약으로 설정
set result=취약

reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" > C:\result\Windows\export\W_72.txt 2>&1

:: 레지스트리 값을 쿼리하고 변수에 할당
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "SynAttackProtect" ^| findstr "SynAttackProtect"') do (
    set SynAttackProtectValue=%%A
)

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "KeepAliveTime" ^| findstr "KeepAliveTime"') do (
    set KeepAliveTimeValue=%%A
)

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableDeadGWDetect" ^| findstr "EnableDeadGWDetect"') do (
    set EnableDeadGWDetectValue=%%A
)

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "NoNameReleaseOnDemand" ^| findstr "NoNameReleaseOnDemand"') do (
    set NoNameReleaseOnDemandValue=%%A
)

echo SynAttackProtect: %SynAttackProtectValue%
echo EnableDeadGWDetect: %EnableDeadGWDetectValue%
echo KeepAliveTime: %KeepAliveTimeValue%
echo NoNameReleaseOnDemand: %NoNameReleaseOnDemandValue%
    
if defined SynAttackProtectValue if "%SynAttackProtectValue%" GEQ "0x1" (
    if defined EnableDeadGWDetectValue if "%EnableDeadGWDetectValue%" equ "0x0" (
        if defined KeepAliveTimeValue if "%KeepAliveTimeValue%" equ "0x493e0" (
            if defined NoNameReleaseOnDemandValue if "%NoNameReleaseOnDemandValue%" equ "0x1" (
                set result=양호
            )
        )
    )
)

echo ================================================================

:: 결과 출력
if %result%==취약 (
    echo W-72,불만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 취약
) else (
    echo W-72,불만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 양호
)

echo ================================================================
pause