@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\PC mkdir C:\result\PC\export

echo ================================================================
echo PC-13: 이동식 미디어에 대한 보안대책 수립 여부 점검
echo ================================================================

REM Query the registry value and write to the file
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" > C:\result\PC\export\PC_13.txt 2>&1

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" ^| findstr "NoDriveTypeAutoRun"') do set NoDriveTypeAutoRunValue=%%A
echo NoDriveTypeAutoRun 값: %NoDriveTypeAutoRunValue%

echo ================================================================

REM Check the registry value
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" >nul 2>&1
if %errorlevel% neq 0 (
    echo PC-13,불만족 >> C:\result\PC\result.txt
    echo ※ 결과 : 취약
) else (
    :: If the key exists, check if the value is 1
    reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" | find "0xff" >nul 2>&1
    if %errorlevel% equ 0 (
        echo PC-13,만족 >> C:\result\PC\result.txt
        echo ※ 결과 : 양호
    ) else (
        echo PC-13,불만족 >> C:\result\PC\result.txt
        echo ※ 결과 : 취약
    )
)
echo ================================================================
pause