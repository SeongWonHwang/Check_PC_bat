@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_23.txt del C:\result\Windows\export\W_23.txt

echo ================================================================
echo W-23: IIS WebDAV 비활성화 여부 점검
echo ================================================================

net start | find /I "llSADMIN" > C:\result\Windows\export\W_23.txt

type C:\result\Windows\export\W_23.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_23.txt) do (
    if %%~zA==0 (
    echo llS 서비스가 실행 중이지 않습니다. >> C:\result\Windows\export\W_23.txt
	echo llS 서비스가 실행 중이지 않습니다.
echo ================================================================
    ) else (
    echo llS 서비스가 실행 중입니다. >> C:\result\Windows\export\W_23.txt
	echo llS 서비스가 실행 중입니다.
echo ================================================================
    )
)

echo 다음 중 한 가지라도 해당하는 경우
echo 1. IIS 서비스를 사용하지 않는 경우
echo 2. DisableWebDAV 값이 1로 설정되어 있는 경우
echo 3. Windows NT, 2000은 서비스팩 4 이상이 설치되어 있는 경우
echo 4. Windows 2003, 2008, 2012, 2016, 2019는 WebDAV가 금지 되어 있는 경우
echo 5. IIS가 설치되지 않았을 때
echo ※ 결과: 양호
echo ================================================================
echo 양호 기준에 한 가지라도 해당하지 않는 경우(2003, 2008, 2012, 2016, 2019는 1,4번만)
echo ※ 결과: 취약
echo ================================================================
echo ※ 수동 점검 
echo W-23,보류 >> C:\result\Windows\result.txt
echo ================================================================

pause