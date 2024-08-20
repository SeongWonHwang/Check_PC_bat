@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\PC mkdir C:\result\PC\export

echo ================================================================
echo PC-15: 윈도우 복구 콘솔 자동 로그인 설정이 허용되어 있는지 점검
echo ================================================================

REM Query the registry value and write to the file
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole" > C:\result\PC\export\PC_15.txt 2>&1

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole" /v "SecurityLevel" ^| findstr "SecurityLevel"') do set SecurityLevelValue=%%A
echo SecurityLevel 값: %SecurityLevelValue%

echo ================================================================

REM Check the registry value
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole" /v "SecurityLevel" >nul 2>&1
if %errorlevel% neq 0 (
    echo PC-15,불만족 >> C:\result\PC\result.txt
    echo ※ 결과 : 취약
) else (
    :: If the key exists, check if the value is 1
    reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole" /v "SecurityLevel" | find "0x0" >nul 2>&1
    if %errorlevel% equ 0 (
		echo PC-15,만족 >> C:\result\PC\result.txt
		echo ※ 결과 : 양호 
    ) else (
		echo PC-15,불만족 >> C:\result\PC\result.txt
		echo ※ 결과 : 취약
    )
)
echo ================================================================
pause