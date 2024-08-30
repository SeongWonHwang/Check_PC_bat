@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-65: Telnet 서비스 구동 비활성화 및 취약한 인증 사용 여부 점검
echo ================================================================

net start | find /I "Telnet" >> C:\result\Windows\export\W_65.txt

type C:\result\Windows\export\W_65.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_65.txt) do (
    if %%~zA==0 (
    echo Telnet 서비스가 실행 중이지 않습니다.
echo ================================================================
        echo W-65,만족 >> C:\result\Windows\result.txt
        echo ※ 결과 : 양호
    ) else (
    echo Telnet 서비스가 실행 중입니다.
echo ================================================================
        echo W-65,불만족 >> C:\result\Windows\result.txt
        echo 수동 점검 필요
    )
)
echo ================================================================
pause