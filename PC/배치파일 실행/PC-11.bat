@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\PC mkdir C:\result\PC\export

echo ================================================================
echo PC-11: �ý����� ��ȭ�� ����� Ȱ��ȭ�Ǿ� �ִ��� ����
echo ================================================================

REM Query the registry value and write to the file
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" > C:\result\PC\export\PC_11.txt 2>&1

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v "EnableFirewall" ^| findstr "EnableFirewall"') do set EnableFirewallValue=%%A
echo EnableFirewall ��: %EnableFirewallValue%

echo ================================================================
REM Check the registry value
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v "EnableFirewall" >nul 2>&1
if %errorlevel% neq 0 (
    echo PC-11,�Ҹ��� >> C:\result\PC\result.txt
    echo �� ��� : ���
) else (
    :: If the key exists, check if the value is 1
    reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v "EnableFirewall" | find "0x1" >nul 2>&1
    if %errorlevel% equ 0 (
		echo PC-11,���� >> C:\result\PC\result.txt
		echo �� ��� : ��ȣ
    ) else (
		echo PC-11,�Ҹ��� >> C:\result\PC\result.txt
		echo �� ��� : ���
    )
)
echo ================================================================
pause