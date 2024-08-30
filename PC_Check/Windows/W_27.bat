@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_27.txt del C:\result\Windows\export\W_27.txt

:: 기존 결과 파일을 삭제하여 중복 기록 방지
if exist C:\result\Windows\export\W_27.txt del C:\result\Windows\export\W_27.txt

echo ================================================================
echo W-27: FTP 서비스의 Anonymous(익명) 접속 허용 여부 점검
echo ================================================================

net start | find /I "FTP Publishing Service" >> C:\result\Windows\export\W_27.txt
net start | find /I "Microsoft FTP Service" >> C:\result\Windows\export\W_27.txt

type C:\result\Windows\export\W_27.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_27.txt) do (
    if %%~zA==0 (
    echo FTP 서비스가 실행 중이지 않습니다.
echo ================================================================
    ) else (
    echo FTP 서비스가 실행 중입니다.
echo ================================================================
    )
)

echo 1. FTP 서비스를 사용하지 않거나, “익명 연결 허용”이 체크되지 않은 경우
echo 2. 상용 FTP 사용으로 익명연결 확인이 불가할 경우 n/a
echo ※ 결과: 양호
echo ================================================================
echo FTP 서비스를 사용하거나, “익명 연결 허용”이 체크되어 있는 경우
echo ※ 결과: 취약
echo ================================================================
echo ※ 수동 점검 
echo W-27,보류 >> C:\result\Windows\result.txt
echo ================================================================

pause