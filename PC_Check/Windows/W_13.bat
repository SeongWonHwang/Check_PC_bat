@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_13.txt del C:\result\Windows\export\W_13.txt

echo ================================================================
echo W-13: IIS 상위 디렉토리 접근 금지 설정 적용 여부 점검
echo ================================================================

net start | find /I "llSADMIN" > C:\result\Windows\export\W_13.txt

type C:\result\Windows\export\W_13.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_13.txt) do (
    if %%~zA==0 (
    echo llS 서비스가 실행 중이지 않습니다. >> C:\result\Windows\export\W_13.txt
	echo llS 서비스가 실행 중이지 않습니다.
echo ================================================================
    ) else (
    echo llS 서비스가 실행 중입니다. >> C:\result\Windows\export\W_13.txt
	echo llS 서비스가 실행 중입니다.
echo ================================================================
    )
)

echo 1. 상위 패스 기능을 제거한 경우
echo 2. IIS가 설치되지 않았을 때
echo ※ 결과: 양호
echo ================================================================
echo 상위 패스 기능을 제거하지 않은 경우
echo ※ 조치 시 마스터 속성과 모든 사이트에 적용함
echo ※ 결과: 취약
echo ================================================================
echo ※ 수동 점검 
echo W-13,보류 >> C:\result\Windows\result.txt
echo ================================================================

pause