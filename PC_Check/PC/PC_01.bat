@echo off

:: C:\result\PC\export 폴더가 없으면 생성
if not exist C:\result\PC mkdir C:\result\PC\export

echo ================================================================
echo PC-01: 최대 암호 사용기간이 "90일" 이하로 설정되어 있는지 점검
echo ================================================================

:: 최대 암호 사용 기간을 CMD 창에 출력하고, C:\result\PC\export\PC_01.txt 파일로 기록
net accounts | find "최대 암호 사용 기간"
net accounts | find "Maximum password age"
net accounts | find "최대 암호 사용 기간" > C:\result\PC\export\PC_01.txt

:: PC_01.txt 파일에서 최대 암호 사용 기간 값을 추출하여 변수 PC_01에 저장
for /f "tokens=6" %%a in (C:\result\PC\export\PC_01.txt) do set PC_01=%%a 
echo ================================================================

:: 변수 PC_01의 값이 90을 초과하면 "취약", 90 이하이면 "양호"로 판단하여 결과를 C:\result\PC\result.txt 파일에 기록
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