@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_28.txt del C:\result\Windows\export\W_28.txt

:: 기존 결과 파일을 삭제하여 중복 기록 방지
if exist C:\result\Windows\export\W_28.txt del C:\result\Windows\export\W_28.txt

echo ================================================================
echo W-28: FTP 접속 가능한 IP 주소 지정 여부 점검
echo ================================================================

net start | find /I "FTP Publishing Service" >> C:\result\Windows\export\W_28.txt
net start | find /I "Microsoft FTP Service" >> C:\result\Windows\export\W_28.txt

type C:\result\Windows\export\W_28.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_28.txt) do (
    if %%~zA==0 (
    echo FTP 서비스가 실행 중이지 않습니다.
echo ================================================================
    ) else (
    echo FTP 서비스가 실행 중입니다.
echo ================================================================
    )
)

echo 1. FTP 서비스를 사용하지 않거나, 특정 IP 주소에서만 FTP 서버에 접속하도록 접근제어 설정을 적용한 경우
echo 2. 상용 FTP 사용으로 접근 제어 확인이 불가할 경우 n/a
echo ※ 결과: 양호
echo ================================================================
echo 특정 IP 주소에서만 FTP 서버에 접속하도록 접근제어 설정을 적용하지 않은 경우
echo ※ 조치 시 마스터 속성과 모든 사이트에 적용함
echo ※ 결과: 취약
echo ================================================================
echo ※ 수동 점검 
echo W-28,보류 >> C:\result\Windows\result.txt
echo ================================================================

pause