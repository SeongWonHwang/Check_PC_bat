@echo off

:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-37: SAM 파일 접근 통제 설정 여부 점검
echo ================================================================

:: 권한 계정 확인
icacls %systemroot%\system32\config\SAM | find /v "파일을 처리했으며" > C:\result\Windows\export\W_37.txt

type C:\result\Windows\export\W_37.txt

echo ================================================================
echo Everyone 권한이 있는 경우 ※ 결과 : 취약
echo Everyone 권한이 없는 경우 ※ 결과 : 양호
echo ================================================================
echo ※ 수동 점검 
echo W-37,보류 >> C:\result\Windows\result.txt

pause