@echo off

:: C:\result 폴더가 존재하지 않으면 생성
if not exist C:\result\Windows mkdir C:\result\Windows
if not exist C:\result\Windows\export mkdir C:\result\Windows\export

echo ================================================================
echo W-40: 원격 시스템 종료 정책 적절성 점검
echo ================================================================

secedit /export /cfg C:\result\Windows\export\export.inf >nul 2>&1

type C:\result\Windows\export\export.inf | find /i "SeRemoteShutdownPrivilege"

:: SeRemoteShutdownPrivilege 설정을 찾고 값 구함.
for /f "tokens=2 delims==" %%a in ('type C:\result\Windows\export\export.inf ^| find /i "SeRemoteShutdownPrivilege"') do (
    set "SeRemoteShutdownPrivilege=%%a"
)

:: 공백 제거
set "SeRemoteShutdownPrivilege=%SeRemoteShutdownPrivilege: =%"

:: SeRemoteShutdownPrivilege 설정 확인
echo SeRemoteShutdownPrivilege 설정값: %SeRemoteShutdownPrivilege%

echo Administrator SID 값: *S-1-5-32-544"
echo ================================================================
if "%SeRemoteShutdownPrivilege%"=="*S-1-5-32-544" (
    echo W-40,만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 양호 
) else (
    echo W-40,불만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 취약
)
echo ================================================================

del C:\result\Windows\export\export.inf

pause