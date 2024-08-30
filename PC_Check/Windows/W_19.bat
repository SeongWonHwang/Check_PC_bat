@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_19.txt del C:\result\Windows\export\W_19.txt

echo ================================================================
echo W-19: 불필요한 IIS 가상 디렉토리 삭제 여부 점검
echo ================================================================

net start | find /I "llSADMIN" > C:\result\Windows\export\W_19.txt

type C:\result\Windows\export\W_19.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_19.txt) do (
    if %%~zA==0 (
    echo llS 서비스가 실행 중이지 않습니다. >> C:\result\Windows\export\W_19.txt
	echo llS 서비스가 실행 중이지 않습니다.
echo ================================================================
    ) else (
    echo llS 서비스가 실행 중입니다. >> C:\result\Windows\export\W_19.txt
	echo llS 서비스가 실행 중입니다.
echo ================================================================
    )
)


echo 1. IIS 6.0 이상 사용하는 경우
echo 2. 해당 웹 사이트에 IIS Admin, IIS Adminpwd 가상 디렉토리가 존재하지 않는 경우
echo 3. IIS가 설치되지 않았을 때
echo ※ 결과: 양호
echo ================================================================
echo 해당 웹 사이트에 IIS Admin, IIS Adminpwd 가상 디렉토리가 존재하는 경우
echo ※ 조치 시 마스터 속성과 모든 사이트에 적용함
echo ※ 결과: 취약
echo ================================================================
echo ※ 수동 점검 
echo W-19,보류 >> C:\result\Windows\result.txt
echo ================================================================

pause