@echo off
:: C:\result 폴더가 존재하지 않으면 생성
if not exist C:\result\Windows mkdir C:\result\Windows\export

:: 기존 결과 파일을 삭제하여 중복 기록 방지
if exist C:\result\Windows\export\W_63.txt del C:\result\Windows\export\W_63.txt

echo ================================================================
echo W-63: DNS 서비스의 동적 업데이트 설정 여부 점검
echo ================================================================

:: 서비스 상태 점검 및 결과 기록
net start | find /I "DNS Client" >> C:\result\Windows\export\W_63.txt

type C:\result\Windows\export\W_63.txt
echo ================================================================

for %%A in (C:\result\Windows\export\W_63.txt) do (
    if %%~zA==0 (
        echo W-63,만족 >> C:\result\Windows\result.txt
        echo ※ 결과 : 양호
    ) else (
        echo W-63,불만족 >> C:\result\Windows\result.txt
        echo ※ 결과 : 취약
    )
)
echo ================================================================
pause