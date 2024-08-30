@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_17.txt del C:\result\Windows\export\W_17.txt
echo ================================================================
echo W-17: IIS 파일 업로드 및 다운로드 제한 설정 여부 점검
echo ================================================================

net start | find /I "llSADMIN" > C:\result\Windows\export\W_17.txt

type C:\result\Windows\export\W_17.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_17.txt) do (
    if %%~zA==0 (
    echo llS 서비스가 실행 중이지 않습니다. >> C:\result\Windows\export\W_17.txt
	echo llS 서비스가 실행 중이지 않습니다.
echo ================================================================
    ) else (
    echo llS 서비스가 실행 중입니다. >> C:\result\Windows\export\W_17.txt
	echo llS 서비스가 실행 중입니다.
echo ================================================================
    )
)

echo 1. 웹 프로세스의 서버 자원 관리를 위해 업로드 및 다운로드 용량을 제한하는 경우
echo 2. 업로드, 다운로드 서비스 기능이 없는 경우
echo 3. IIS가 설치되지 않았을 때
echo ※ 결과: 양호
echo ================================================================
echo 웹 프로세스의 서버 자원을 관리하지 않는 경우(업로드 및 다운로드 용량 미 제한)
echo ※ 결과: 취약
echo ================================================================
echo ※ 수동 점검 
echo W-17,보류 >> C:\result\Windows\result.txt
echo ================================================================

pause