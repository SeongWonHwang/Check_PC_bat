@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\PC mkdir C:\result\PC\export

echo ================================================================
echo PC-19: 원격 지원을 사용하지 않도록 설정하고 있는지 점검
echo ================================================================

REM Query the registry value and write to the file
reg query "HKEY_LOCAL_MACHINE\Software\policies\Microsoft\Windows NT\Terminal Services" >> C:\result\PC\export\PC_19.txt 2>&1

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\Software\policies\Microsoft\Windows NT\Terminal Services" /v "fAllowUnsolicited" ^| findstr "fAllowUnsolicited"') do set fAllowUnsolicitedValue=%%A
echo fAllowUnsolicited 값: %fAllowUnsolicitedValue%

echo ================================================================

REM Check the registry value
reg query "HKEY_LOCAL_MACHINE\Software\policies\Microsoft\Windows NT\Terminal Services" /v "fAllowUnsolicited" >nul 2>&1
if %errorlevel% neq 0 (
	echo PC-19,불만족 >> C:\result\PC\result.txt
	echo ※ 결과 : 취약
) else (
    :: If the key exists, check if the value is 0
    reg query "HKEY_LOCAL_MACHINE\Software\policies\Microsoft\Windows NT\Terminal Services" /v "fAllowUnsolicited" | find "0x0" >nul 2>&1
    if %errorlevel% equ 0 (
		echo PC-19,만족 >> C:\result\PC\result.txt
		echo ※ 결과 : 양호 
    ) else (
		echo PC-19,불만족 >> C:\result\PC\result.txt
		echo ※ 결과 : 취약
    )
)

echo =====================================
pause