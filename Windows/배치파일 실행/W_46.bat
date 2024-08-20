@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-46: Everyone 사용 권한을 익명 사용자에 적용 정책의 설정 여부 점검
echo ================================================================

:: Query the registry value and write to the file
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" > C:\result\Windows\export\W_46.txt 2>&1

:: Display only the ShutdownWithoutLogon value from the registry query
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v "everyoneincludesanonymous" ^| findstr "everyoneincludesanonymous"') do set everyoneincludesanonymousValue=%%A
echo everyoneincludesanonymous 값: %everyoneincludesanonymousValue%

set result=사용

if "%everyoneincludesanonymousValue%"=="0x0" (
set result=사용 안함
)

echo 네트워크 액세스: Everyone 사용 권한을 익명 사용자에게 적용: %result%

echo ================================================================

:: Check the everyoneincludesanonymous value
if "%everyoneincludesanonymousValue%"=="0x0" (
    echo W-46,만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 양호 
) else (
    echo W-46,불만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 취약
)

echo ================================================================
pause