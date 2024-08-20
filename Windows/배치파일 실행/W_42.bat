@echo off

:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows
if not exist C:\result\Windows\export mkdir C:\result\Windows\export

echo ================================================================
echo W-42: SAM 계정과 공유의 익명 열거 허용 안 함’ 정책 설정 여부 점검
echo ================================================================

:: Query the registry values and write to the file
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" > C:\result\Windows\export\W_41.txt 2>&1

:: Display only the RestrictAnonymous value from the registry query
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v "RestrictAnonymous" ^| findstr "RestrictAnonymous"') do set RestrictAnonymousValue=%%A
echo RestrictAnonymous 값: %RestrictAnonymousValue%

:: Display only the RestrictAnonymousSAM value from the registry query
for /f "tokens=3" %%B in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v "RestrictAnonymousSAM" ^| findstr "RestrictAnonymousSAM"') do set RestrictAnonymousSAMValue=%%B
echo RestrictAnonymousSAM 값: %RestrictAnonymousSAMValue%

set "result_RA=사용"
set "result_RAS=사용"

if "%RestrictAnonymousValue%"=="0x0" (
    set "result_RA=사용 안함"
)

if "%RestrictAnonymousSAMValue%"=="0x0" (
    set "result_RAS=사용 안함"
)

echo 네트워크 액세스: SAM 계정과 공유의 익명 열거 허용 안 함: %result_RA%
echo 네트워크 액세스: SAM 계정의 익명 열거 허용 안 함: %result_RAS%

echo ================================================================

:: Check both RestrictAnonymous and RestrictAnonymousSAM values
set "Result=양호"

if "%RestrictAnonymousValue%"=="0x0" (
    set "Result=양호"
)

if "%RestrictAnonymousSAMValue%"=="0x0" (
    set "Result=취약"
)

:: 결과 평가 및 저장
if "%Result%"=="취약" (
    echo W-41,불만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 취약
) else (
    echo W-41,만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 양호
)

echo ================================================================
pause