@echo off
:: C:\result 폴더가 존재하지 않으면 생성
if not exist C:\result\PC mkdir C:\result\PC\export

if exist C:\result\PC\export\PC_14.txt del C:\result\PC\export\PC_14.txt

echo ================================================================
echo PC-14: 장기간(3개월) 사용하지 않은 ActiveX 존재 여부 점검
echo ================================================================

echo internet Explorer ^> 인터넷 옵션 ^> 추가 기능 관리 ^> 불필요한 ActiveX 삭제 > C:\result\PC\export\PC_14.txt
echo 설치된 ActiveX를 주기적(매달 1번 권고)으로 점검하고 불필요한 ActiveX를 삭제하는 경우: ※ 결과: 양호
echo ================================================================
echo 설치된 ActiveX에 대한 주기적인 점검 및 삭제가 이루어지지 않는 경우                  : ※ 결과: 취약
echo ================================================================
echo ※ 수동 점검 
echo PC-14,보류 >> C:\result\PC\result.txt

echo ================================================================

pause