@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-39: 비로그온 사용자의 시스템 종료 허용 여부 점검
echo ================================================================

:: Query the registry value and write to the file
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\ShutdownWithoutLogon" > C:\result\Windows\export\W_39.txt 2>&1

:: Display only the ShutdownWithoutLogon value from the registry query
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ShutdownWithoutLogon" ^| findstr "ShutdownWithoutLogon"') do set ShutdownWithoutLogonValue=%%A
echo ShutdownWithoutLogon 값: %ShutdownWithoutLogonValue%

set result=사용

if "%ShutdownWithoutLogonValue%"=="0x0" (
set result=사용 안함
)

echo 시스템 종료: 로그온하지 않고 시스템 종료 허용: %result% 

echo ================================================================

:: Check the ShutdownWithoutLogon value
if "%ShutdownWithoutLogonValue%"=="0x0" (
    echo W-39,만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 양호 
) else (
    echo W-39,불만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 취약
)

echo ================================================================
pause