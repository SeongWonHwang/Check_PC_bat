@echo off

:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows
if not exist C:\result\Windows\export mkdir C:\result\Windows\export

echo ================================================================
echo W-51: 패스워드 최소 사용 기간 정책 설정 여부 점검
echo ================================================================

:: 최대 암호 사용 기간을 CMD 창에 출력하고, C:\result\Windows\export\W_51.txt 파일로 기록
net accounts | find "최소 암호 사용 기간"
net accounts | find "Minimum password age"
net accounts | find "최소 암호 사용 기간" > C:\result\Windows\export\W_51.txt

:: PC_01.txt 파일에서 최대 암호 사용 기간 값을 추출하여 변수 PC_01에 저장
for /f "tokens=6" %%a in (C:\result\Windows\export\W_51.txt) do set W_51=%%a
echo ================================================================

:: 변수 W_51의 값이 0이면 "취약", 1이상이면 "양호"로 판단하여 결과를 C:\result\Windows\result.txt 파일에 기록
if %W_51% == 0 (
    echo ※ 결과 : 취약
    echo W-51,불만족 >> C:\result\Windows\result.txt
    goto W51
)

echo ※ 결과 : 양호
echo W-51,만족 >> C:\result\Windows\result.txt
echo ================================================================
:W51
pause