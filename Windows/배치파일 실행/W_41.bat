@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-39: 비로그온 사용자의 시스템 종료 허용 여부 점검
echo ================================================================

:: Query the registry value and write to the file
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" > C:\result\Windows\export\W_41.txt 2>&1

:: Display only the ShutdownWithoutLogon value from the registry query
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v "crashonauditfail" ^| findstr "crashonauditfail"') do set crashonauditfailValue=%%A
echo crashonauditfail 값: %crashonauditfailValue%

if "%crashonauditfailValue%"=="0x0" (
echo 감사: 보안 감사를 로그할 수 없는 경우 즉시 시스템 종료 속성 : 사용 안함
) else (
echo 감사: 보안 감사를 로그할 수 없는 경우 즉시 시스템 종료 속성 : 사용
)
echo ================================================================

:: Check the crashonauditfail value
if "%crashonauditfailValue%"=="0x0" (
    echo W-41,만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 양호 
) else (
    echo W-41,불만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 취약
)

echo ================================================================
pause