@echo off
:: C:\result 폴더가 존재하지 않으면 생성
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-44: 관리자 이외 NTFS 미디어 포맷 및 꺼내기 허용 여부 점검
echo ================================================================

:: 초기 result 값을 취약
set result=취약

:: AllocateDASDValue 초기화
set AllocateDASDValue=

:: 레지스트리 값을 쿼리하고 결과를 파일에 쓰기
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" > C:\result\Windows\export\W_44.txt 2>&1


:: AllocateDASD 값을 쿼리
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AllocateDASD" 2^>nul ^| findstr "AllocateDASD"') do set AllocateDASDValue=%%A

:: AllocateDASDValue가 "0"이 아닌 경우에만 취약으로 설정
if not defined AllocateDASDValue (
    echo W-44,불만족 >> C:\result\Windows\result.txt
    echo ================================================================
	echo 이동식 미디어 포맷 및 꺼내기 허용: 구성되지 않음
	    echo ================================================================
    echo ※ 결과 : 취약
    goto End
    )
)

if "%AllocateDASDValue%"=="0" (
set result=양호
)

echo ================================================================

:: 결과 출력
if "%result%"=="양호" (
    echo 장치: 이동식 미디어 포맷 및 꺼내기 허용: Adiministrators
	echo ================================================================
    echo W-44,만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 양호 
) else (
    echo echo 장치: 이동식 미디어 포맷 및 꺼내기 허용: Adiministrators 외 다른계정
	echo ================================================================
    echo W-44,불만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 취약
)

:End
echo ================================================================
pause