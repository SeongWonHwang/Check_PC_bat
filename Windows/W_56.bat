@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-56: 콘솔 로그인 시 빈 암호 사용 가능 여부 점검
echo ================================================================

:: Query the registry value and write to the file
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" > C:\result\Windows\export\W_56.txt 2>&1

:: Display only the ShutdownWithoutLogon value from the registry query
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v "LimitBlankPasswordUse" ^| findstr "LimitBlankPasswordUse"') do set LimitBlankPasswordUseValue=%%A
echo LimitBlankPasswordUse 값: %LimitBlankPasswordUseValue%

set result=사용

if "%LimitBlankPasswordUseValue%"=="0x0" (
set result=사용 안함
)

echo 계정: 콘솔 로그온 시 로컬 계정에서 빈 암호 사용 제한: %result%

echo ================================================================

:: Check the LimitBlankPasswordUse value
if "%LimitBlankPasswordUseValue%"=="0x1" (
    echo W-56,만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 양호 
) else (
    echo W-56,불만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 취약
)

echo ================================================================
pause