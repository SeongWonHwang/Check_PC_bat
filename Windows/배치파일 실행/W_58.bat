@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-58: �͹̳� ���� ��ȣȭ ���� ������ ����
echo ================================================================

:: Query the registry value and write to the file
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" > C:\result\Windows\export\W_58.txt 2>&1

:: Display only the ShutdownWithoutLogon value from the registry query
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v "MinEncryptionLevel" ^| findstr "MinEncryptionLevel"') do set MinEncryptionLevelValue=%%A
echo MinEncryptionLevel ��: %MinEncryptionLevelValue%

echo ================================================================

:: Check the MinEncryptionLevel value
if "%MinEncryptionLevelValue%" GEQ "0x2" (
    echo W-58,���� >> C:\result\Windows\result.txt
    echo �� ��� : ��ȣ 
) else (
    echo W-58,�Ҹ��� >> C:\result\Windows\result.txt
    echo �� ��� : ���
)

echo ================================================================
pause