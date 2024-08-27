@echo off
:: C:\result 폴더가 존재하지 않으면 생성
if not exist C:\result\Windows mkdir C:\result\Windows\export

:: 기존 결과 파일을 삭제하여 중복 기록 방지
if exist C:\result\Windows\export\W_35.txt del C:\result\Windows\export\W_35.txt

echo ================================================================
echo W-35: 원격 레지스트리 서비스 사용 여부 점검
echo ================================================================

:: 서비스에서 확인
net start | find /I "Remote Registry Service" >> C:\result\Windows\export\W_35.txt

type C:\result\Windows\export\W_35.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_35.txt) do (
    if %%~zA==0 (
    echo 원격 레지스트리 서비스가 실행 중이지 않습니다.
echo ================================================================
        echo W-35,만족 >> C:\result\Windows\result.txt
        echo ※ 결과 : 양호
    ) else (
    echo 원격 레지스트리 서비스가 실행 중입니다.
echo ================================================================
        echo W-35,불만족 >> C:\result\Windows\result.txt
        echo ※ 결과 : 취약
    )
)
echo ================================================================
pause