@echo off

echo ================================================================
echo PC-01: 최대 암호 사용기간이 "90일" 이하로 설정되어 있는지 점검
echo ================================================================

:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\PC mkdir C:\result\PC\export

net accounts | find "최대 암호 사용 기간" 
net accounts | find "Maximum password age" 
net accounts | find "최대 암호 사용 기간" > C:\result\PC\export\PC_01.txt
for /f "tokens=6" %%a in (C:\result\PC\export\PC_01.txt) do set PC_01=%%a 
echo ================================================================

if %PC_01% GTR 90 (
    echo ※ 결과 : 취약
    echo PC-01,불만족 >> C:\result\PC\result.txt
    goto PC1
)

echo ※ 결과 : 양호
echo PC-01,만족 >> C:\result\PC\result.txt
echo ================================================================
:PC1
pause