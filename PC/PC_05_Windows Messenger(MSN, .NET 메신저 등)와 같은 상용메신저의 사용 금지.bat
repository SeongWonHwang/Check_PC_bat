@echo off
:: C:\result 폴더가 존재하지 않으면 생성
if not exist C:\result\PC mkdir C:\result\PC\export

echo ================================================================
echo PC-05: 사용자 PC에서 상용 메신저를 사용하고 있는지를 점검
echo ================================================================

:: 초기 result 값을 양호로 설정
set result=취약

:: PreventRunValue 변수를 초기화
set PreventRunValue=

:: 레지스트리 값 가져오기
reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Messenger\Client" > C:\result\PC\export\PC_05.txt 2>&1

:: PreventRun 값 가져오기
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Messenger\Client" /v "PreventRun" ^| findstr "PreventRun"') do set PreventRunValue=%%A

:: PreventRun 값이 설정 되지 않을 경우 처리
if not defined PreventRunValue (
echo 레지스트리 키가 존재하지 않음 >> C:\result\PC\result.txt
	echo Windows Messenger 실행 허용 안 함: 구성되지 않음
	echo ================================================================
    echo ※ 결과 : 취약
    goto End
)
if "%PreventRunValue%" equ "0x1" (
    set result=양호
)

echo ================================================================

:: 결과 출력
if %result%==취약 (
    echo PC-05,불만족 >> C:\result\PC\result.txt
		echo Windows Messenger 실행 허용 안 함: 사용 안 함
	echo ================================================================
    echo ※ 결과 : 취약
) else (
    echo PC-05,만족 >> C:\result\PC\result.txt
		echo Windows Messenger 실행 허용 안 함: 사용
	echo ================================================================
    echo ※ 결과 : 양호
)

:End
echo ================================================================
pause