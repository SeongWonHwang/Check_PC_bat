@echo off

:: C:\result\PC\export 폴더가 없으면 생성
if not exist C:\result\PC mkdir C:\result\PC\export

echo ================================================================
echo PC-02: 패스워드 설정 정책이 복잡성을 만족하는지 점검
echo ================================================================

:: 최대 암호 사용 기간을 CMD 창에 출력하고, C:\result\PC\export\PC_02.txt 파일로 기록
net accounts | find "최소 암호 길이"
net accounts | find "Minimum password length"
net accounts | find "최소 암호 길이" > C:\result\PC\export\PC_02.txt

:: PC_02.txt 파일에서 최대 암호 사용 기간 값을 추출하여 변수 PC_02에 저장
for /f "tokens=4" %%a in (C:\result\PC\export\PC_02.txt) do set PC_02=%%a 

:: 보안 정책을 inf 파일로 내보냅니다.
secedit /export /cfg C:\result\PC\export\export.inf /areas SECURITYPOLICY >nul 2>&1

:: UTF-16 파일을 ANSI로 변환
type C:\result\PC\export\export.inf > C:\result\PC\export\export_ansi.inf

:: 내보낸 파일에서 PasswordComplexity 설정을 확인합니다.
findstr /r /c:"PasswordComplexity = 1" C:\result\PC\export\export_ansi.inf >nul
if %ERRORLEVEL% equ 0 (
    set PasswordComplexity=1
    echo 암호는 복잡성을 만족해야 함:                              사용
) else (
    set PasswordComplexity=0
    echo 암호는 복잡성을 만족해야 함:                          사용 안 함
)

:: 결과 평가
set Result=양호
if %PC_02% LSS 8 (
    set Result=취약
)

if %PasswordComplexity% equ 0 (
    set Result=취약
)
echo ================================================================

:: 결과 출력 및 저장
if "%Result%" equ "양호" (
    echo ※ 결과 : 양호
    echo PC-02,만족 >> C:\result\PC\result.txt
) else (
    echo ※ 결과 : 취약
    echo PC-02,불만족 >> C:\result\PC\result.txt
)

echo ================================================================

del C:\result\PC\export\export.inf
del C:\result\PC\export\export_ansi.inf	

pause