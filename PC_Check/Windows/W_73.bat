@echo off
:: C:\result\Windows\export ������ �������� ������ ����
if not exist C:\result\Windows\export mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_66.txt del C:\result\Windows\export\W_73.txt

echo ================================================================
echo W-73: ������� ������ ����̺� ��ġ ���� ���� ����
echo ================================================================

reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers" > C:\result\Windows\export\W_73.txt 2>&1

:: Display only the ShutdownWithoutLogon value from the registry query
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers" /v "AddPrinterDrivers" ^| findstr "AddPrinterDrivers"') do set AddPrinterDriversValue=%%A

set result=���

if "%AddPrinterDriversValue%"=="0x0" (
set result=��� ����
)

echo ��ġ: ���� �����Ϳ� ������ �� ����ڰ� ������ ����̹��� ��ġ�� �� ���� ��: %result% 

echo ================================================================

:: Check the ShutdownWithoutLogon value
if "%AddPrinterDriversValue%"=="0x1" (
    echo W-73,���� >> C:\result\Windows\result.txt
    echo �� ��� : ��ȣ 
) else (
    echo W-73,�Ҹ��� >> C:\result\Windows\result.txt
    echo �� ��� : ���
)

echo ================================================================
pause