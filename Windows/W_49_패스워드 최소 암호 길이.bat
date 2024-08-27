@echo off

:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows
if not exist C:\result\Windows\export mkdir C:\result\Windows\export

echo ================================================================
echo W-49: 패스워드 최소 암호 길이 정책 설정 여부 점검
echo ================================================================

:: 최대 암호 사용 기간을 CMD 창에 출력하고, C:\result\Windows\export\W_49.txt 파일로 기록
net accounts | find "최소 암호 길이"
net accounts | find "Minimum password length"
net accounts | find "최소 암호 길이" > C:\result\Windows\export\W_49.txt

echo ================================================================

:: 최소암호 길이 저장
for /f "tokens=4" %%a in (C:\result\Windows\export\W_49.txt) do set W_49=%%a 

:: 결과 평가
set Result=양호
if %W_49% LSS 8 (
    set Result=취약
)

:: 결과 출력 및 저장
if "%Result%" equ "양호" (
    echo ※ 결과 : 양호
    echo W-49,만족 >> C:\result\Windows\result.txt
) else (
    echo ※ 결과 : 취약
    echo W-49,불만족 >> C:\result\Windows\result.txt
)

echo ================================================================

pause