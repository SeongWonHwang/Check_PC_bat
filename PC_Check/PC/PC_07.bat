@echo off
:: C:\result 폴더가 존재하지 않으면 생성
if not exist C:\result\PC mkdir C:\result\PC\export

if exist C:\result\PC\export\PC_07.txt del C:\result\PC\export\PC_07.txt

echo ================================================================
echo PC-07: 시스템에 최신 서비스팩이 적용되어 있는지 점검
echo ================================================================

systeminfo > C:\result\PC\export\PC_07_temp.txt 2>&1

:: OS 정보와 핫픽스 정보를 추출하고, 경로 정보 제거
findstr /r "^OS" C:\result\PC\export\PC_07_temp.txt | findstr /v "C:\result\PC\export\PC_07_temp.txt" >> C:\result\PC\export\PC_07.txt

echo 핫픽스: >> C:\result\PC\export\PC_07.txt
findstr /r "KB" C:\result\PC\export\PC_07_temp.txt | findstr /v "C:\result\PC\export\PC_07_temp.txt" >> C:\result\PC\export\PC_07.txt

type C:\result\PC\export\PC_07.txt

echo ================================================================

echo 최신 서비스팩이 적용 되어 있고 내부적으로 관리 절차를 수립하여 이행하고 있는 경우   : ※ 결과: 양호
echo ================================================================
echo 최신 서비스팩이 적용 되어 있지 않거나 내부적으로 관리 절차가 수립되어 있지 않은 경우: ※ 결과: 취약
echo ================================================================
echo ※ 수동 점검
echo PC-07,보류 >> C:\result\PC\result.txt

echo ================================================================

del C:\result\PC\export\PC_07_temp.txt
pause