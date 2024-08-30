@echo off
:: C:\result 폴더가 존재하지 않으면 생성
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-29: DNS Zone Transfer 차단 설정 여부 점검
echo ================================================================

::초기 result 값을 양호으로 설정
set result=양호

:: SecureSecondariesValue 변수를 초기화
set SecureSecondariesValue=

:: 레지스트리 값 가져오기
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones\jinis" >> C:\result\Windows\export\W_29.txt 2>&1

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones\jinis" /v "SecureSecondaries" 2^>nul ^| findstr "SecureSecondaries"') do set SecureSecondariesValue=%%A

if not defined SecureSecondariesValue (
	echo W-29,만족 >> C:\result\Windows\result.txt
    echo ================================================================
	echo DNS Service 사용하지 않음
	    echo ================================================================
    echo ※ 결과 : 양호
    goto End
)

:: SecureSecondaries 값 확인 및 결과 설정
if "%SecureSecondariesValue"=="0x1" (
set result=취약
)

echo ================================================================

:: 결과 출력
if "%result%"=="취약" (
echo W-29,만족 >> C:\result\Windows\result.txt
echo DNS Service 사용
echo ================================================================
echo ※ 결과 : 취약
) else (
echo W-29,불만족 >> C:\result\Windows\result.txt
echo DNS Service 사용하지 않음
echo ================================================================
echo ※ 결과 : 양호
)

:End
echo ================================================================
pause