@echo off

:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows
if not exist C:\result\Windows\export mkdir C:\result\Windows\export

echo ================================================================
echo W-48: 계정 패스워드 복잡성 정책 설정 여부 점검
echo ================================================================

:: 보안 정책을 inf 파일로 내보냅니다.
secedit /export /cfg C:\result\Windows\export\export.inf /areas SECURITYPOLICY >nul 2>&1

type C:\result\Windows\export\export.inf > C:\result\Windows\export\export_ansi.inf

echo ================================================================

:: 내보낸 파일에서 PasswordComplexity 설정을 확인합니다.
findstr /r /c:"PasswordComplexity = 1" C:\result\Windows\export\export_ansi.inf >nul
if %ERRORLEVEL% equ 0 (
    set PasswordComplexity=1
    echo 암호는 복잡성을 만족해야 함:                              사용
) else (
    set PasswordComplexity=0
    echo 암호는 복잡성을 만족해야 함:                          사용 안 함
)

:: 결과 평가
set Result=양호
if %PasswordComplexity% equ 0 (
    set Result=취약
)
echo ================================================================

:: 결과 출력 및 저장
if "%Result%" equ "양호" (
    echo ※ 결과 : 양호
    echo W-48,만족 >> C:\result\Windows\result.txt
) else (
    echo ※ 결과 : 취약
    echo W-48,불만족 >> C:\result\Windows\result.txt
)

echo ================================================================

del C:\result\Windows\export\export.inf
del C:\result\Windows\export\export_ansi.inf	

pause