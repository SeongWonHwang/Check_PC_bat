@echo off

:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows
if not exist C:\result\Windows\export mkdir C:\result\Windows\export

echo ================================================================
echo W-40: 원격 시스템 종료 정책 적절성 점검
echo ================================================================

:: 보안 정책을 inf 파일로 내보냅니다.
secedit /export /cfg C:\result\Windows\export\export.inf >nul 2>&1

:: SeRemoteShutdownPrivilege 설정을 찾습니다.
set "PrivilegeCheck=0"
set "ExpectedValue=S-1-5-32-544"

for /f "tokens=*" %%i in (C:\result\Windows\export\export.inf) do (
    echo %%i | findstr /c:"SeRemoteShutdownPrivilege = " >nul
    if %ERRORLEVEL% equ 0 (
        echo %%i | findstr /c:"%ExpectedValue%" >nul
        if %ERRORLEVEL% equ 0 (
            set "PrivilegeCheck=1"
            goto CheckDone
        )
    )
)

:CheckDone
echo ================================================================

:: 디버깅을 위해 변수 값 출력
echo PrivilegeCheck = %PrivilegeCheck%

:: 결과 평가 및 저장
if "%PrivilegeCheck%" equ "1" (
    set "Result=양호"
    echo ※ 결과 : 양호
    echo W-40,만족 >> C:\result\Windows\result.txt
) else (
    set "Result=취약"
    echo ※ 결과 : 취약
    echo W-40,불만족 >> C:\result\Windows\result.txt
)

pause