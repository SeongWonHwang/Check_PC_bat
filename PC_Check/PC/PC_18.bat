@echo off

:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\PC mkdir C:\result\PC\export

echo ================================================================
echo PC-18: 브라우저 인터넷 옵션에 있는 고급 설정에 “브라우저를 닫을 때 임시 인터넷 파일 폴더 비우기” 기능이 활성화 되어 있는지 점검
echo ================================================================

REM Query the registry value and write to the file
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\InternetSettings\Cache" >> C:\result\PC\export\PC_18.txt 2>&1

:: 초기 result 값을 취약으로 설정
set result=취약

:: SecurityLevelValue 변수를 초기화
set PersistentValue=

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\InternetSettings\Cache" /v "Persistent" 2^>nul ^| findstr "Persistent"') do set PersistentValue=%%A

:: Persistent 값이 설정되지 않을 경우 처리
if not defined PersistentValue (
		echo PC-18,불만족 >> C:\result\PC\result.txt
		echo 브라우저를 닫을 때 임시 인터넷 파일 폴더 비우기” 설정이 “사용”으로 설정되어 있지 않음
		echo ================================================================
		echo ※ 결과 : 취약
    goto End
)

:: Persistent 값 확인 및 결과 설정
if "%PersistentValue%"=="0x0" (
    set result=양호
)

:: 결과 출력
if "%result%"=="양호" (
	echo PC-18,만족 >> C:\result\PC\result.txt
		echo 브라우저를 닫을 때 임시 인터넷 파일 폴더 비우기” 설정이 “사용”으로 설정됨
		echo ================================================================
		echo ※ 결과 : 양호
    ) else (
		echo PC-18,불만족 >> C:\result\PC\result.txt
		echo 브라우저를 닫을 때 임시 인터넷 파일 폴더 비우기” 설정이 “사용”으로 설정되어 있지 않음
		echo ================================================================
		echo ※ 결과 : 취약
		)

:End
echo ================================================================
pause