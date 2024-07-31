@echo off

echo ================================================================
echo PC-17: 브라우저 인터넷 옵션에 있는 고급 설정에 “브라우저를 닫을 때 임시 인터넷 파일 폴더 비우기” 기능이 활성화 되어 있는지 점검
echo ================================================================

REM Query the registry value and write to the file
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\InternetSettings\Cache" >> C:\result\PC\export\PC_18.txt 2>&1

REM Check the registry value
reg query "SOFTWARE\Microsoft\Windows\CurrentVersion\InternetSettings\Cache" /v "Persistent" >nul 2>&1
if %errorlevel% neq 0 (
    echo PC-18,불만족 >> C:\result\PC\result.txt
    echo ※ 결과 : 취약
) else (
    :: If the key exists, check if the value is 1
    reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\InternetSettings\Cache" /v "Persistentl" | find "0x0" >nul 2>&1
    if %errorlevel% equ 0 (
		echo PC-18,만족 >> C:\result\PC\result.txt
		echo ※ 결과 : 양호
    ) else (
		echo PC-18,불만족 >> C:\result\PC\result.txt
		echo ※ 결과 : 취약
    )
)
echo =====================================
pause