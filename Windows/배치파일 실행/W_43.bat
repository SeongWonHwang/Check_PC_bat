@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-43: Autologon 기능 제어 설정 여부 점검
echo ================================================================

:: Query the registry value and write to the file
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" > C:\result\Windows\export\W_41.txt 2>&1

:: Display only the ShutdownWithoutLogon value from the registry query
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoAdminLogon" ^| findstr "AutoAdminLogon"') do set AutoAdminLogonValue=%%A
echo AutoAdminLogon 값: %AutoAdminLogonValue%

echo ================================================================

:: Check the AutoAdminLogon value
if "%AutoAdminLogonValue%"=="0x1" (
    echo W-43,만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 취약
) else (
    echo W-43,불만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 양호
)

echo ================================================================
pause