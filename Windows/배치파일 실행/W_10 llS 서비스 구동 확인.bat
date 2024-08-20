@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-10: 불필요한 IIS 서비스 구동 여부 점검
echo ================================================================

net start | find /I "llSADMIN" >> C:\result\Windows\export\W_10.txt

type C:\result\Windows\export\W_10.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_10.txt) do (
    if %%~zA==0 (
    echo llS 서비스가 실행 중이지 않습니다.
echo ================================================================
        echo W-10,만족 >> C:\result\Windows\result.txt
        echo ※ 결과 : 양호
    ) else (
    echo llS 서비스가 실행 중입니다.
echo ================================================================
        echo W-10,불만족 >> C:\result\Windows\result.txt
        echo ※ 결과 : 취약
    )
)
echo ================================================================
pause