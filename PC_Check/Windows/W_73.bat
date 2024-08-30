@echo off
:: C:\result\Windows\export 폴더가 존재하지 않으면 생성
if not exist C:\result\Windows\export mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_66.txt del C:\result\Windows\export\W_73.txt

echo ================================================================
echo W-73: 사용자의 프린터 드라이브 설치 차단 여부 점검
echo ================================================================

reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers" > C:\result\Windows\export\W_73.txt 2>&1

:: Display only the ShutdownWithoutLogon value from the registry query
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers" /v "AddPrinterDrivers" ^| findstr "AddPrinterDrivers"') do set AddPrinterDriversValue=%%A

set result=사용

if "%AddPrinterDriversValue%"=="0x0" (
set result=사용 안함
)

echo 장치: 공유 프린터에 연결할 때 사용자가 프린터 드라이버를 설치할 수 없게 함: %result% 

echo ================================================================

:: Check the ShutdownWithoutLogon value
if "%AddPrinterDriversValue%"=="0x1" (
    echo W-73,만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 양호 
) else (
    echo W-73,불만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 취약
)

echo ================================================================
pause