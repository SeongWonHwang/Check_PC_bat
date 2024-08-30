@echo off
:: C:\result 폴더가 존재하지 않으면 생성
if not exist C:\result\PC mkdir C:\result\PC\export

if exist C:\result\PC\export\PC_06.txt del C:\result\PC\export\PC_06.txt

echo ================================================================
echo PC-06: 시스템에 관련한 공개된 취약점에 대한 최신 보안패치를 적용하였는지 점검
echo ================================================================

systeminfo > C:\result\PC\export\PC_06_temp.txt 2>&1

:: OS 정보와 핫픽스 정보를 추출하고, 경로 정보 제거
findstr /r "^OS" C:\result\PC\export\PC_06_temp.txt | findstr /v "C:\result\PC\export\PC_06_temp.txt" >> C:\result\PC\export\PC_06.txt

echo 핫픽스: >> C:\result\PC\export\PC_06.txt
findstr /r "KB" C:\result\PC\export\PC_06_temp.txt | findstr /v "C:\result\PC\export\PC_06_temp.txt" >> C:\result\PC\export\PC_06.txt

type C:\result\PC\export\PC_06.txt

echo ================================================================
echo HOT FIX 설치 및 자동 업데이트 설정이 되어 있고 내부적으로 관리 절차를 수립하여 이행하고 있는 경우: ※ 결과: 양호
echo ================================================================
echo HOT FIX가 설치되어 있지 않거나 내부적으로 관리 절차가 수립되어 있지 않은 경우                    : ※ 결과: 취약
echo ================================================================
echo ※ 수동 점검
echo PC-06,보류 >> C:\result\PC\result.txt

echo ================================================================

del C:\result\PC\export\PC_06_temp.txt
pause