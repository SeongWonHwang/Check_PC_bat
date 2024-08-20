@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-44: 관리자 이외 NTFS 미디어 포맷 및 꺼내기 허용 여부 점검
echo ================================================================

:: Query the registry value and write to the file
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" > C:\result\Windows\export\W_44.txt 2>&1

:: Display only the ShutdownWithoutLogon value from the registry query
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AllocateDASD" ^| findstr "AllocateDASD"') do set AllocateDASDValue=%%A
echo AllocateDASD 값: %AllocateDASDValue%

set result=0
if %ERRORLEVEL%==0 (
    set result=1
)

if "%AllocateDASDValue%"=="0" (
    set result=1
)

if %result%==1 (
echo 장치: 이동식 미디어 포맷 및 꺼내기 허용: 양호
) else (
echo echo 장치: 이동식 미디어 포맷 및 꺼내기 허용: 취약
)




echo ================================================================

:: Check the AllocateDASD value
if %result%==1 (
    echo W-44,만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 양호 
) else (
    echo W-44,불만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 취약
)

echo ================================================================
pause