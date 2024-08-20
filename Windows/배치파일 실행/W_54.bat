@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-54: 익명 SID/이름 변환 허용 해제
echo ================================================================

:: 보안 정책을 inf 파일로 내보냅니다.
secedit /export /cfg C:\result\Windows\export\export.inf /areas SECURITYPOLICY >nul 2>&1

type C:\result\Windows\export\export.inf > C:\result\Windows\export\export_ansi.inf


:: 내보낸 파일에서 LSAAnonymousNameLookup 설정을 확인합니다.
findstr /r /c:"LSAAnonymousNameLookup = 1" C:\result\Windows\export\export_ansi.inf >nul
if %ERRORLEVEL% equ 0 (
    set LSAAnonymousNameLookup=1
    echo 네트워크 액세스: 익명 SID/이름 변환 허용: 사용
) else (
    set LSAAnonymousNameLookup=0
    echo 네트워크 액세스: 익명 SID/이름 변환 허용: 사용 안 함
)

:: 결과 평가
set Result=양호
if %LSAAnonymousNameLookup% equ 0 (
    set Result=취약
)
echo ================================================================

:: 결과 출력 및 저장
if "%Result%" equ "양호" (
    echo ※ 결과 : 취약
    echo W-54,불만족 >> C:\result\Windows\result.txt
) else (
    echo ※ 결과 : 양호
    echo W-54,만족 >> C:\result\Windows\result.txt
)

echo ================================================================

del C:\result\Windows\export\export.inf
del C:\result\Windows\export\export_ansi.inf	

pause