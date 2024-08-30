@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_15.txt del C:\result\Windows\export\W_15.txt
echo ================================================================
echo W-15: 웹 프로세스 권한 제한 설정 여부 점검
echo ================================================================

net start | find /I "llSADMIN" > C:\result\Windows\export\W_15.txt

type C:\result\Windows\export\W_15.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_15.txt) do (
    if %%~zA==0 (
    echo llS 서비스가 실행 중이지 않습니다. >> C:\result\Windows\export\W_15.txt
	echo llS 서비스가 실행 중이지 않습니다.
echo ================================================================
    ) else (
    echo llS 서비스가 실행 중입니다. >> C:\result\Windows\export\W_15.txt
	echo llS 서비스가 실행 중입니다.
echo ================================================================
    )
)

echo 1. 웹 프로세스가 웹 서비스 운영에 필요한 최소한 권한으로 설정되어 있는 경우
echo - IIS 전용 계정(nobody)을 생성
echo - IIS 전용 계정(nobody)의 그룹에 다른 계정 미존재
echo - 서비스로 로그온에 IIS 전용 계정(nobody) 추가
echo - IIS ADMIN 서비스의 로그온 계정 지정(nobody)
echo 2. IIS가 설치되지 않았을 때
echo 3. 2008 R2(IIS 7.5) 이상의 버전을 사용중일 때
echo (※ IIS 7.5 이상은 Default로 ApplicationPoolIdentity가 적용되어 양호)
echo ※ 결과: 양호
echo ================================================================
echo 웹 프로세스가 관리자 권한이 부여된 계정으로 구동되고 있는 경우
echo ※ 결과: 취약
echo ================================================================
echo ※ 수동 점검 
echo W-15,보류 >> C:\result\Windows\result.txt
echo ================================================================

pause