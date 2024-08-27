@echo off
:: C:\result 폴더가 존재하지 않으면 생성
if not exist C:\result\PC mkdir C:\result\PC\export

echo ================================================================
echo PC-19: 원격 지원을 사용하지 않도록 설정하고 있는지 점검
echo ================================================================

::초기 result 값을 양호으로 설정
set result=양호

:: fAllowUnsolicitedValue 변수를 초기화
set fAllowUnsolicitedValue=

:: 레지스트리 값 가져오기
reg query "HKEY_LOCAL_MACHINE\Software\policies\Microsoft\Windows NT\Terminal Services" >> C:\result\PC\export\PC_19.txt 2>&1

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\Software\policies\Microsoft\Windows NT\Terminal Services" /v "fAllowUnsolicited" ^| findstr "fAllowUnsolicited"') do set fAllowUnsolicitedValue=%%A

if not defined fAllowUnsolicitedValue (
	echo PC-19,만족 >> C:\result\PC\result.txt
    echo ================================================================
	echo 원격 지원 제공: 구성되지 않음
	    echo ================================================================
    echo ※ 결과 : 양호
    goto End
)

:: fAllowUnsolicited 값 확인 및 결과 설정
if "%fAllowUnsolicitedValue"=="0x1" (
set result=취약
)

echo ================================================================

:: 결과 출력
if "%result%"=="취약" (
echo PC-19,만족 >> C:\result\PC\result.txt
echo 원격 지원 제공: 사용
echo ================================================================
echo ※ 결과 : 취약
) else (
echo PC-19,불만족 >> C:\result\PC\result.txt
echo 원격 지원 제공: 사용 안 함
echo ================================================================
echo ※ 결과 : 양호
)

:End
echo ================================================================
pause