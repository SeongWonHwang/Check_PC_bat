@echo off
:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_30.txt del C:\result\Windows\export\W_30.txt

echo ================================================================
echo W-30: RDS(Remote Data Services) 비활성화 여부 점검
echo ================================================================

net start | find /I "llSADMIN" > C:\result\Windows\export\W_30.txt

for %%A in (C:\result\Windows\export\W_30.txt) do (
    if %%~zA==0 (
    echo llS 서비스가 실행 중이지 않습니다. >> C:\result\Windows\export\W_30.txt
    ) else (
    echo llS 서비스가 실행 중입니다. >> C:\result\Windows\export\W_30.txt
    )
)

wmic os get caption | findstr /I "Windows" >> C:\result\Windows\export\W_30.txt

for /f "tokens=3" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\W3SVC\Parameters\ADCLaunch" /v "RDSServer.DataFactory" 2^>nul ^| findstr "RDSServer.DataFactory"') do set RDSServer.DataFactoryValue=%%A
if not defined RDSServer.DataFactoryValue (
    set RDSServer.DataFactoryValue=존재하지 않음
)
echo RDSServer.DataFactory 값: %RDSServer.DataFactoryValue% >> C:\result\Windows\export\W_30.txt

:: AdvancedDataFactory 값 가져오기
for /f "tokens=3" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\W3SVC\Parameters\ADCLaunch" /v "AdvancedDataFactory" 2^>nul ^| findstr "AdvancedDataFactory"') do set AdvancedDataFactoryValue=%%A
if not defined AdvancedDataFactoryValue (
    set AdvancedDataFactoryValue=존재하지 않음
)
echo AdvancedDataFactory 값: %AdvancedDataFactoryValue% >> C:\result\Windows\export\W_30.txt

:: VbBusObj.VbBusObjCls 값 가져오기
for /f "tokens=3" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\W3SVC\Parameters\ADCLaunch" /v "VbBusObj.VbBusObjCls" 2^>nul ^| findstr "VbBusObj.VbBusObjCls"') do set VbBusObj.VbBusObjClsValue=%%A
if not defined VbBusObj.VbBusObjClsValue (
    set VbBusObj.VbBusObjClsValue=존재하지 않음
)
echo VbBusObj.VbBusObjCls 값: %VbBusObj.VbBusObjClsValue% >> C:\result\Windows\export\W_30.txt

type C:\result\Windows\export\W_30.txt

echo ================================================================
echo 다음 중 한 가지라도 해당되는 경우(2008 이상 양호)
echo 1. IIS를 사용하지 않는 경우
echo 2. Windows 2000 서비스팩 4, Windows 2003 서비스팩 2 이상 설치된 경우
echo 3. 디폴트 웹 사이트에 MSADC 가상 디렉토리가 존재하지 않는 경우
echo 4. 해당 레지스트리 값이 존재하지 않는 경우
echo ※ 결과: 양호
echo ================================================================
echo 양호 기준에 한 가지라도 해당하지 않는 경우(2003, 2008, 2012, 2016, 2019는 1,4번만)
echo ※ 결과: 취약
echo ================================================================
echo ※ 수동 점검 
echo W-30,보류 >> C:\result\Windows\result.txt
echo ================================================================

pause