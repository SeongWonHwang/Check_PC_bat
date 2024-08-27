@echo off

:: C:\result 폴더가 존재하지 않으면 생성
if not exist C:\result\Windows mkdir C:\result\Windows\export

:: 기존 결과 파일을 삭제하여 중복 기록 방지
if exist C:\result\Windows\export\W_05.txt del C:\result\Windows\export\W_05.txt

echo ================================================================
echo W-05: 해독 가능한 암호화 사용 여부 점검
echo ================================================================

:: 보안 정책을 inf 파일로 내보냄
secedit /export /cfg C:\result\Windows\export\export.inf /areas SECURITYPOLICY >nul 2>&1


:: UTF-16 파일을 ANSI로 변환
type C:\result\Windows\export\export.inf > C:\result\Windows\export\export_ansi.inf

:: 내보낸 파일에서 PasswordComplexity 설정을 확인
findstr /r /c:"ClearTextPassword = 1" C:\result\Windows\export\export_ansi.inf >nul
if %ERRORLEVEL% equ 0 (
    set ClearTextPassword=1
    echo 해독 가능한 암호화를 사용하여 암호 저장:                     사용 >> C:\result\Windows\export\W_05.txt
	echo 해독 가능한 암호화를 사용하여 암호 저장:                     사용
) else (
    set ClearTextPassword=0
    echo 해독 가능한 암호화를 사용하여 암호 저장:                사용 안 함 >> C:\result\Windows\export\W_05.txt
	echo 해독 가능한 암호화를 사용하여 암호 저장:                사용 안 함
)

echo ================================================================

set Result=취약
if %ClearTextPassword% equ 0 (
    set Result=양호
) 
	
if "%Result%" equ "양호" (
    echo ※ 결과 : 양호
    echo W-05,불만족 >> C:\result\Windows\result.txt
    
) else (
    echo ※ 결과 : 취약   
    echo W-05,만족 >> C:\result\Windows\result.txt
)

del C:\result\Windows\export\export.inf
del C:\result\Windows\export\export_ansi.inf	

pause