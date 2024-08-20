@echo off

:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-37: SAM 파일 접근 통제 설정 여부 점검
echo ================================================================

:: 권한을 확인할 파일이나 디렉터리 경로를 지정하십시오.
set TARGET_PATH=C:\Windows\System32\config\SAM

:: 결과를 저장할 파일 경로를 지정하십시오.
set OUTPUT_FILE=C:\result\Windows\export\W_37.txt

:: 권한 정보를 임시 파일에 저장하고 불필요한 메시지를 제거합니다.
icacls %TARGET_PATH% > temp_permissions.txt 2>nul

:: "파일을 처리했으며..."와 관련된 라인 제거
for /f "tokens=*" %%i in (temp_permissions.txt) do (
    echo %%i | findstr /v /c:"파일을 처리했으며" >> filtered_permissions.txt
)

:: 파일의 권한 정보를 CMD 창에 출력
echo %TARGET_PATH%의 권한 정보:
type filtered_permissions.txt

:: 권한 정보 필터링: SYSTEM과 Administrators만 있는지 확인
findstr /v /c:"BUILTIN\Administrators" /c:"NT AUTHORITY\SYSTEM" filtered_permissions.txt > non_standard_permissions.txt

echo ================================================================

:: 비표준 권한이 있는지 여부를 확인하여 결과를 처리
if %errorlevel%==1 (
    echo W-37,만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 양호
) else (
    echo W-37,불만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 취약
)

echo ================================================================

:: 임시 파일 삭제
del temp_permissions.txt
del filtered_permissions.txt
del non_standard_permissions.txt

pause