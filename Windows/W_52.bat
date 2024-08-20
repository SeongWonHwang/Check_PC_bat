@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-52: 로그인 화면에 마지막 로그온 사용자 이름을 표시하지 않도록 설정되었는지 여부를 점검
echo ================================================================

:: Query the registry value and write to the file
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" > C:\result\Windows\export\W_39.txt 2>&1

:: Display only the dontdisplaylastusername value from the registry query
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "dontdisplaylastusername" ^| findstr "dontdisplaylastusername"') do set dontdisplaylastusernameValue=%%A
echo dontdisplaylastusername 값: %dontdisplaylastusernameValue%

set result=사용
:: Check the dontdisplaylastusername value
if "%dontdisplaylastusernameValue%"=="0x0" (
set result=사용 안함
)

echo 대화형 로그온: 마지막 로그인 사용자 이름 표시 안 함: %result%

echo ================================================================

:: Check the dontdisplaylastusername value
if "%dontdisplaylastusernameValue%"=="0x1" (
    echo W-52,만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 양호 
) else (
    echo W-52,불만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 취약
set result=사용 안함
)

echo ================================================================
pause