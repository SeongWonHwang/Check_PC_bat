@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_16.txt del C:\result\Windows\export\W_16.txt

echo ================================================================
echo W-16: IIS 링크 사용금지 설정 여부 점검
echo ================================================================

net start | find /I "llSADMIN" > C:\result\Windows\export\W_16.txt

type C:\result\Windows\export\W_16.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_16.txt) do (
    if %%~zA==0 (
    echo llS 서비스가 실행 중이지 않습니다. >> C:\result\Windows\export\W_16.txt
	echo llS 서비스가 실행 중이지 않습니다.
echo ================================================================
    ) else (
    echo llS 서비스가 실행 중입니다. >> C:\result\Windows\export\W_16.txt
	echo llS 서비스가 실행 중입니다.
echo ================================================================
    )
)

echo 1. 심볼릭 링크, aliases, 바로가기 등의 사용을 허용하지 않는 경우
echo 2. IIS가 설치되지 않았을 때
echo ※ 결과: 양호
echo ================================================================
echo 심볼릭 링크, aliases, 바로가기 등의 사용을 허용하는 경우
echo ※ 결과: 취약
echo ================================================================
echo ※ 수동 점검 
echo W-16,보류 >> C:\result\Windows\result.txt
echo ================================================================

pause