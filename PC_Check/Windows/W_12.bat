@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_12.txt del C:\result\Windows\export\W_12.txt
echo ================================================================
echo W-12: IIS CGI 실행 제한 설정 여부 점검
echo ================================================================

net start | find /I "llSADMIN" > C:\result\Windows\export\W_12.txt

type C:\result\Windows\export\W_12.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_12.txt) do (
    if %%~zA==0 (
    echo llS 서비스가 실행 중이지 않습니다. >> C:\result\Windows\export\W_12.txt
	echo llS 서비스가 실행 중이지 않습니다.
echo ================================================================
    ) else (
    echo llS 서비스가 실행 중입니다. >> C:\result\Windows\export\W_12.txt
	echo llS 서비스가 실행 중입니다.
echo ================================================================
    )
)


echo 1. IIS Home Directory에 scripts 폴더가 없는 경우
echo 2. 해당 디렉토리 Everyone에 모든 권한, 수정 권한, 쓰기 권한이 부여되지 않은 경우
echo 3. IIS가 설치되지 않았을 때
echo ※ 결과: 양호
echo ================================================================
echo 해당 디렉토리 Everyone에 모든 권한, 수정 권한, 쓰기 권한이 부여되어 있는 경우
echo ※ 조치 시 마스터 속성과 모든 사이트에 적용함
echo ※ 결과: 취약
echo ================================================================
echo ※ 수동 점검 
echo W-12,보류 >> C:\result\Windows\result.txt
echo ================================================================

pause