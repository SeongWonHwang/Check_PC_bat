@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_18.txt del C:\result\Windows\export\W_18.txt

echo ================================================================
echo W-18: Global.asa 또는 별도의 DB 컨넥션을 하는 파일에 대한 취약점 점검
echo ================================================================

net start | find /I "llSADMIN" > C:\result\Windows\export\W_18.txt

type C:\result\Windows\export\W_18.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_18.txt) do (
    if %%~zA==0 (
    echo llS 서비스가 실행 중이지 않습니다. >> C:\result\Windows\export\W_18.txt
	echo llS 서비스가 실행 중이지 않습니다.
echo ================================================================
    ) else (
    echo llS 서비스가 실행 중입니다. >> C:\result\Windows\export\W_18.txt
	echo llS 서비스가 실행 중입니다.
echo ================================================================
    )
)

echo 1. IIS 5.0, 6.0
echo - .asa 매핑이 존재하는 경우
echo 2. IIS 7.0, 8.0, 10.0
echo - 요청 필터링에서 .asa, .asax 설정이 없거나, 확장자가 False 설정된 경우
echo 3. IIS가 설치되지 않았을 때
echo ※ 결과: 양호
echo ================================================================
echo 1. IIS 5.0, 6.0
echo - .asa 매핑이 존재하지 않는 경우
echo 2. IIS 7.0, 8.0, 10.0
echo - 요청 필터링에서 .asa, .asax 설정이 존재하고, 확장자가 True 설정된 경우
echo ※ 결과: 취약
echo ================================================================
echo ※ 수동 점검 
echo W-18,보류 >> C:\result\Windows\result.txt
echo ================================================================

pause