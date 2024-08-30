@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_59.txt del C:\result\Windows\export\W_59.txt
echo ================================================================
echo W-59: IIS 웹서비스 정보 숨김 설정 여부 점검
echo ================================================================

net start | find /I "llSADMIN" > C:\result\Windows\export\W_59.txt

type C:\result\Windows\export\W_59.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_59.txt) do (
    if %%~zA==0 (
    echo llS 서비스가 실행 중이지 않습니다. >> C:\result\Windows\export\W_59.txt
	echo llS 서비스가 실행 중이지 않습니다.
echo ================================================================
    ) else (
    echo llS 서비스가 실행 중입니다. >> C:\result\Windows\export\W_59.txt
	echo llS 서비스가 실행 중입니다.
echo ================================================================
    )
)

echo 1. 웹 서비스 에러 페이지가 별도로 지정되어 있는 경우
echo 2. IIS가 설치되지 않았을 경우
echo 3. IIS 서비스를 사용하지 않으나 포트(80)이 열린 경우
echo ※ 결과: 양호
echo ================================================================
echo 웹 서비스 에러 페이지가 별도로 지정되지 않아 에러 발생 시 중요 정보가 노출 되는 경우
echo ※ 결과: 취약
echo ================================================================
echo ※ 수동 점검 
echo W-59,보류 >> C:\result\Windows\result.txt
echo ================================================================

pause