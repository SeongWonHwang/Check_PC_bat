@echo off
:: C:\result 폴더가 존재하지 않으면 생성
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_32.txt del C:\result\Windows\export\W_32.txt

echo ================================================================
echo W-32: 최신 Hot Fix 적용 여부 점검
echo ================================================================

systeminfo > C:\result\Windows\export\W_32_temp.txt 2>&1

:: OS 정보와 핫픽스 정보를 추출하고, 경로 정보 제거
findstr /r "^OS" C:\result\Windows\export\W_32_temp.txt | findstr /v "C:\result\Windows\export\W_32_temp.txt" >> C:\result\Windows\export\W_32.txt

echo 핫픽스: >> C:\result\Windows\export\W_32.txt
findstr /r "KB" C:\result\Windows\export\W_32_temp.txt | findstr /v "C:\result\Windows\export\W_32_temp.txt" >> C:\result\Windows\export\W_32.txt

type C:\result\Windows\export\W_32.txt

echo ================================================================

echo 최신 Hotfix 또는,PMS(Patch Management System) Agent가 설치되어 있는 경우
echo - 제어시스템 패치 업데이트 기준·절차 등 패치 적용 정책이 수립되어있고, 정책에 따라 주기적으로 패치 업데이트 검토, 업데이트 등 관리하는 경우: 
echo ※ 결과: 양호
echo ================================================================
echo 1. 최신 Hotfix 또는, PMS(Patch Management System) Agent가 설치되어 있지 않은 경우
echo - 별도의 정책이 없거나, 정책을 따르지 않거나, 3개월 이내에 Hotfix 이력이 없는 경우
echo 2. MS기술지원 종료된 운영체제 사용: 
echo ※ 결과: 취약
echo ================================================================
echo ※ 수동 점검
echo W-32,보류 >> C:\result\Windows\result.txt

echo ================================================================

del C:\result\Windows\export\W_32_temp.txt
pause