@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_22.txt del C:\result\Windows\export\W_22.txt

echo ================================================================
echo W-22: IIS Exec 명령어 쉘 호출 진단
echo ================================================================

net start | find /I "llSADMIN" > C:\result\Windows\export\W_22.txt

type C:\result\Windows\export\W_22.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_22.txt) do (
    if %%~zA==0 (
    echo llS 서비스가 실행 중이지 않습니다. >> C:\result\Windows\export\W_22.txt
	echo llS 서비스가 실행 중이지 않습니다.
echo ================================================================
    ) else (
    echo llS 서비스가 실행 중입니다. >> C:\result\Windows\export\W_22.txt
	echo llS 서비스가 실행 중입니다.
echo ================================================================
    )
)

echo IIS 5.0 버전에서 해당 레지스트리 값이 0이거나, IIS 6.0 버전 이상인 경우
echo IIS가 설치되지 않았을 때
echo ※ 결과: 양호
echo ================================================================
echo IIS 5.0 버전에서 해당 레지스트리 값이 1인 경우
echo ※ 결과: 취약
echo ================================================================
echo ※ 수동 점검 
echo W-22,보류 >> C:\result\Windows\result.txt
echo ================================================================

pause