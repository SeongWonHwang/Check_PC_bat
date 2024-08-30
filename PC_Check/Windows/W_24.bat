@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_24.txt del C:\result\Windows\export\W_24.txt

echo ================================================================
echo W-24: NetBIOS 바인딩 서비스 구동 여부 점검
echo ================================================================

nbtstat -n | find /I "NetBIOS" > C:\result\Windows\export\W_24.txt

ipconfig /all
echo ================================================================

for %%A in (C:\result\Windows\export\W_24.txt) do (
    if %%~zA==0 (
        echo W-24,만족 >> C:\result\Windows\result.txt
        echo ※ 결과 : 양호
    ) else (
        echo W-24,불만족 >> C:\result\Windows\result.txt
        echo ※ 결과 : 취약
    )
)
echo ================================================================

pause