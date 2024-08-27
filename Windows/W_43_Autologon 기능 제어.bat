@echo off
:: C:\result 폴더가 존재하지 않으면 생성
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-43: Autologon 기능 제어 설정 여부 점검
echo ================================================================

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" > C:\result\Windows\export\W_43.txt 2>&1

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoAdminLogon" ^| findstr "AutoAdminLogon"') do set AutoAdminLogonValue=%%A

echo ================================================================

if "%AutoAdminLogonValue%"=="0x1" (
    echo W-43,만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 취약
) else (
    echo W-43,불만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 양호
)

echo ================================================================
pause