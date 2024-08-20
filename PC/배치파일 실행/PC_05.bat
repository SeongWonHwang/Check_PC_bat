@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\PC mkdir C:\result\PC\export

echo ================================================================
echo PC-05: 사용자 PC에서 상용 메신저를 사용하고 있는지를 점검
echo ================================================================

:: Query the registry value and write to the file
reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Messenger\Client" > C:\result\PC\export\PC_05.txt 2>&1

:: Display only the PreventRun value from the registry query
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Messenger\Client" /v "PreventRun" ^| findstr "PreventRun"') do set PreventRunValue=%%A
echo PreventRun 값: %PreventRunValue%

echo ================================================================

:: Check the registry value
reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Messenger\Client" /v "PreventRun" >nul 2>&1
if %errorlevel% neq 0 (
    echo PC-05,불만족 >> C:\result\PC\result.txt
    echo ※ 결과 : 취약
) else (
    :: If the key exists, check if the value is 1
    reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Messenger\Client" /v "PreventRun" | find "0x1" >nul 2>&1
    if %errorlevel% equ 0 (
        echo PC-05,만족 >> C:\result\PC\result.txt
        echo ※ 결과 : 양호 
    ) else (
        echo PC-05,불만족 >> C:\result\PC\result.txt
        echo ※ 결과 : 취약
    )
)
echo ================================================================
pause