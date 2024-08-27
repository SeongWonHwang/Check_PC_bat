@echo off
:: C:\result 폴더가 존재하지 않으면 생성
if not exist C:\result\PC mkdir C:\result\PC\export

echo ================================================================
echo PC-15: 윈도우 복구 콘솔 자동 로그인 설정이 허용되어 있는지 점검
echo ================================================================

:: 초기 result 값을 취약으로 설정
set result=취약

:: SecurityLevelValue 변수를 초기화
set SecurityLevelValue=

:: 레지스트리 값 가져오기
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole" > C:\result\PC\export\PC_15.txt 2>&1

:: SecurityLevel 값 가져오기
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole" /v "SecurityLevel" ^| findstr "SecurityLevel"') do set SecurityLevelValue=%%A

:: SecurityLevel 값이 설정되지 않을 경우 처리
if not defined SecurityLevelValue (
    echo 레지스트리 키가 존재하지 않음 >> C:\result\PC\result.txt
    echo 방화벽 설정 없음
    echo ================================================================
    echo ※ 결과 : 취약
    goto End
)

:: SecurityLevel 값 확인 및 결과 설정
if "%SecurityLevelValue%"=="0x1" (
    set result=양호
)

echo ================================================================

:: 결과 출력
if "%result%"=="취약" (
	echo PC-15,만족 >> C:\result\PC\result.txt
		echo 복구 콘솔: 자동 관리 로그온 허용: 사용 안함
		echo ================================================================
		echo ※ 결과 : 양호 
    ) else (
		echo PC-15,불만족 >> C:\result\PC\result.txt
		echo 복구 콘솔: 자동 관리 로그온 허용: 사용
		echo ================================================================
		echo ※ 결과 : 취약
		)

:End
echo ================================================================
pause