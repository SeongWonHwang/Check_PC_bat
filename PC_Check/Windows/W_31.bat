@echo off
:: C:\result 폴더가 존재하지 않으면 생성
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_31.txt del C:\result\Windows\export\W_31.txt

echo ================================================================
echo W-31: 시스템에 최신 서비스팩이 적용되어 있는지 점검
echo ================================================================

systeminfo > C:\result\Windows\export\W_31_temp.txt 2>&1

:: OS 정보와 핫픽스 정보를 추출하고, 경로 정보 제거
findstr /r "^OS" C:\result\Windows\export\W_31_temp.txt | findstr /v "C:\result\Windows\export\W_31_temp.txt" >> C:\result\Windows\export\W_31.txt

echo 핫픽스: >> C:\result\Windows\export\W_31.txt
findstr /r "KB" C:\result\Windows\export\W_31_temp.txt | findstr /v "C:\result\Windows\export\W_31_temp.txt" >> C:\result\Windows\export\W_31.txt

type C:\result\Windows\export\W_31.txt

echo ================================================================

echo 최신 서비스팩이 설치되어 있는 경우: ※ 결과: 양호
echo ================================================================
echo 최신 서비스팩이 설치되지 않은 경우: ※ 결과: 취약
echo ================================================================
echo ※ 수동 점검
echo W-31,보류 >> C:\result\Windows\result.txt

echo ================================================================

del C:\result\Windows\export\W_31_temp.txt
pause