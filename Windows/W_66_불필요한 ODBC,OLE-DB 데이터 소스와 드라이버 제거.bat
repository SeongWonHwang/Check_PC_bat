@echo off
:: C:\result\Windows\export 폴더가 존재하지 않으면 생성
if not exist C:\result\Windows\export mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_66.txt del C:\result\Windows\export\W_66.txt

echo ================================================================
echo W-66: 불필요한 ODBC/OLE-DB 데이터 소스와 드라이브 제거 여부 점검
echo ================================================================

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\ODBC Data Sources" > C:\result\Windows\export\W_66.txt 2>&1

:: 레지스트리 값을 변수에 임시 저장
setlocal
set "output="
for /f "tokens=*" %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\ODBC Data Sources" 2^>nul') do (
    set "output=%%i"
    echo %%i>C:\result\Windows\export\W_66.txt
)

type C:\result\Windows\export\W_66.txt
:: 파일이 비어 있는지 확인하여 결과 처리
if defined output (
    echo ================================================================
    echo W-66,불만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 취약
) else (
    echo ================================================================
    echo W-66,만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 양호
)

endlocal
echo ================================================================
pause