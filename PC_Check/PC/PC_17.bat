@echo off
:: C:\result 폴더가 존재하지 않으면 생성
if not exist C:\result\PC mkdir C:\result\PC\export

echo ================================================================
echo PC-17: 사용자 PC에 하나의 OS만 설치되어 있는지 점검
echo ================================================================

set loaderCount=0

bcdedit /enum > C:\result\PC\export\PC_17.txt

:: C 드라이브의 텍스트 파일에서 "Windows 부팅 로더" 항목을 검색
if %ERRORLEVEL% equ 0 (
    findstr /r /c:"Windows 부팅 로더" C:\result\PC\export\PC_17.txt >nul
    if %ERRORLEVEL% equ 0 (
        set /a loaderCount+=1
    )
)

:: 부팅 로더 항목 수를 출력
echo OS 개수: %loaderCount%

if %loaderCount%==1 (
    echo PC-17,만족 >> C:\result\PC\result.txt
    echo ※ 결과 : 양호
) else (
    echo PC-17,불만족 >> C:\result\PC\result.txt
    echo ※ 결과 : 취약
)

		echo ================================================================
pause