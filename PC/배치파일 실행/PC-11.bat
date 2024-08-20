@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\PC mkdir C:\result\PC\export

echo ================================================================
echo PC-11: 시스템의 방화벽 기능이 활성화되어 있는지 점검
echo ================================================================

REM Query the registry value and write to the file
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" > C:\result\PC\export\PC_11.txt 2>&1

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v "EnableFirewall" ^| findstr "EnableFirewall"') do set EnableFirewallValue=%%A
echo EnableFirewall 값: %EnableFirewallValue%

echo ================================================================
REM Check the registry value
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v "EnableFirewall" >nul 2>&1
if %errorlevel% neq 0 (
    echo PC-11,불만족 >> C:\result\PC\result.txt
    echo ※ 결과 : 취약
) else (
    :: If the key exists, check if the value is 1
    reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v "EnableFirewall" | find "0x1" >nul 2>&1
    if %errorlevel% equ 0 (
		echo PC-11,만족 >> C:\result\PC\result.txt
		echo ※ 결과 : 양호
    ) else (
		echo PC-11,불만족 >> C:\result\PC\result.txt
		echo ※ 결과 : 취약
    )
)
echo ================================================================
pause