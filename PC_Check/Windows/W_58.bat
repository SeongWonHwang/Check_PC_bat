@echo off
:: C:\result 폴더가 존재하지 않으면 생성
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-58: 터미널 서비스 암호화 수준 적절성 점검
echo ================================================================

reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" > C:\result\Windows\export\W_58.txt 2>&1

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v "MinEncryptionLevel" ^| findstr "MinEncryptionLevel"') do set MinEncryptionLevelValue=%%A

echo ================================================================

if "%MinEncryptionLevelValue%" GEQ "0x2" (
    echo W-58,만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 양호 
) else (
    echo W-58,불만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 취약
)

echo ================================================================
pause