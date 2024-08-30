@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

:: 기존 결과 파일을 삭제하여 중복 기록 방지
if exist C:\result\Windows\export\W_25.txt del C:\result\Windows\export\W_25.txt

echo ================================================================
echo W-25: 시스템 내 FTP 서비스 구동 여부 점검
echo ================================================================

net start | find /I "FTP Publishing Service" >> C:\result\Windows\export\W_25.txt
net start | find /I "Microsoft FTP Service" >> C:\result\Windows\export\W_25.txt

type C:\result\Windows\export\W_25.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_25.txt) do (
    if %%~zA==0 (
    echo FTP 서비스가 실행 중이지 않습니다.
echo ================================================================
        echo W-25,만족 >> C:\result\Windows\result.txt
        echo ※ 결과 : 양호
    ) else (
    echo FTP 서비스가 실행 중입니다.
echo ================================================================
        echo W-25,불만족 >> C:\result\Windows\result.txt
        echo ※ 결과 : 취약
    )
)
echo ================================================================
pause