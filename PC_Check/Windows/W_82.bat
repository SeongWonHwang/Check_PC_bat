@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_82.txt del C:\result\Windows\export\W_82.txt
echo ================================================================
echo W-82: 웹서버 디렉토리 리스팅 차단 설정 여부 점검
echo ================================================================

echo 1. Windows 인증 모드를 사용하고 sa계정이 비활성화되어 있는 경우
echo 2. sa계정 사용 시 강력한 암호정책을 설정한 경우
echo - 암호 정책 강제 적용 및 암호 만료 강제 적용 설정(D-1 참조)
echo 3. DBMS 설치가 안된 경우
echo 4. MSSQL 외 DBMS 설치된 경우
echo ※ 결과: 양호
echo ================================================================
echo 혼합 인증 모드를 사용하고, 활성화 된 sa 계정에 대해 강력한 암호정책 설정을 하지 않은 경우
echo ※ 결과: 취약
echo ================================================================
echo ※ 수동 점검 
echo W-82,보류 >> C:\result\Windows\result.txt
echo ================================================================

pause