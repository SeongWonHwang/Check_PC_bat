@echo off

:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-02: Guest 계정 비활성화 여부 점검
echo ================================================================

REM Check if the Guest account is disabled based on "활성 계정" output
net user guest | findstr /i "활성 계정" | findstr "예" >nul 2>&1
if %errorlevel% equ 0 (
    echo Guest 계정 활성화됨
    echo ================================================================
    echo Guest 계정 활성화됨 > C:\result\Windows\export\W_02.txt
    echo W-02,불만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 취약
) else (
    echo Guest 계정 비활성화됨
    echo ================================================================
    echo Guest 계정 비활성화됨 > C:\result\Windows\export\W_02.txt
    echo W-02,만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 양호
)

echo ================================================================

pause