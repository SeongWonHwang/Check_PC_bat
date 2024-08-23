@echo off
:: C:\result\Windows\export 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows\export mkdir C:\result\Windows\export

:: 이전 W_74.txt 파일을 삭제
if exist C:\result\Windows\export\W_74.txt del C:\result\Windows\export\W_74.txt

echo ================================================================
echo W-74: 세션 연결 중단 시 유휴시간 설정 여부 점검
echo ================================================================

:: 레지스트리 값 쿼리
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" > C:\result\Windows\export\W_73.txt 2>&1

:: EnableForcedLogoff 값 가져오기
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "EnableForcedLogoff" ^| findstr "EnableForcedLogoff"') do set EnableForcedLogoffValue=%%A

:: autodisconnect 값 가져오기
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "autodisconnect" ^| findstr "autodisconnect"') do set autodisconnectValue=%%A

echo ================================================================

:: 초기 결과 값을 설정
set result=사용 안함
set result_temp=취약

:: EnableForcedLogoff 값이 0x0이면 취약으로 설정
if "%EnableForcedLogoffValue%"=="0x1" (
    set result=사용
	if defined autodisconnectValue if "%autodisconnectValue%" equ "0xf" (
    set result_temp=양호
	set /a autodisconnectValueDec=autodisconnectValue
	)
)

echo 장치: 공유 프린터에 연결할 때 사용자가 프린터 드라이버를 설치할 수 없게 함: %result%
echo Microsoft 네트워크 서버: 세션 연결을 중단하기 전에 필요한 유휴 시간: %autodisconnectValueDec%분
echo ================================================================

:: 결과에 따라 파일에 기록
if "%result_temp%"=="취약" (
    echo W-74,불만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 취약
) else (
    echo W-74,만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 양호
)

echo ================================================================
pause