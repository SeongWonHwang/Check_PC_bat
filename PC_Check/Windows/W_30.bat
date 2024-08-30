@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_30.txt del C:\result\Windows\export\W_30.txt

echo ================================================================
echo W-30: RDS(Remote Data Services) ��Ȱ��ȭ ���� ����
echo ================================================================

net start | find /I "llSADMIN" > C:\result\Windows\export\W_30.txt

for %%A in (C:\result\Windows\export\W_30.txt) do (
    if %%~zA==0 (
    echo llS ���񽺰� ���� ������ �ʽ��ϴ�. >> C:\result\Windows\export\W_30.txt
    ) else (
    echo llS ���񽺰� ���� ���Դϴ�. >> C:\result\Windows\export\W_30.txt
    )
)

wmic os get caption | findstr /I "Windows" >> C:\result\Windows\export\W_30.txt

for /f "tokens=3" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\W3SVC\Parameters\ADCLaunch" /v "RDSServer.DataFactory" 2^>nul ^| findstr "RDSServer.DataFactory"') do set RDSServer.DataFactoryValue=%%A
if not defined RDSServer.DataFactoryValue (
    set RDSServer.DataFactoryValue=�������� ����
)
echo RDSServer.DataFactory ��: %RDSServer.DataFactoryValue% >> C:\result\Windows\export\W_30.txt

:: AdvancedDataFactory �� ��������
for /f "tokens=3" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\W3SVC\Parameters\ADCLaunch" /v "AdvancedDataFactory" 2^>nul ^| findstr "AdvancedDataFactory"') do set AdvancedDataFactoryValue=%%A
if not defined AdvancedDataFactoryValue (
    set AdvancedDataFactoryValue=�������� ����
)
echo AdvancedDataFactory ��: %AdvancedDataFactoryValue% >> C:\result\Windows\export\W_30.txt

:: VbBusObj.VbBusObjCls �� ��������
for /f "tokens=3" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\W3SVC\Parameters\ADCLaunch" /v "VbBusObj.VbBusObjCls" 2^>nul ^| findstr "VbBusObj.VbBusObjCls"') do set VbBusObj.VbBusObjClsValue=%%A
if not defined VbBusObj.VbBusObjClsValue (
    set VbBusObj.VbBusObjClsValue=�������� ����
)
echo VbBusObj.VbBusObjCls ��: %VbBusObj.VbBusObjClsValue% >> C:\result\Windows\export\W_30.txt

type C:\result\Windows\export\W_30.txt

echo ================================================================
echo ���� �� �� ������ �ش�Ǵ� ���(2008 �̻� ��ȣ)
echo 1. IIS�� ������� �ʴ� ���
echo 2. Windows 2000 ������ 4, Windows 2003 ������ 2 �̻� ��ġ�� ���
echo 3. ����Ʈ �� ����Ʈ�� MSADC ���� ���丮�� �������� �ʴ� ���
echo 4. �ش� ������Ʈ�� ���� �������� �ʴ� ���
echo �� ���: ��ȣ
echo ================================================================
echo ��ȣ ���ؿ� �� ������ �ش����� �ʴ� ���(2003, 2008, 2012, 2016, 2019�� 1,4����)
echo �� ���: ���
echo ================================================================
echo �� ���� ���� 
echo W-30,���� >> C:\result\Windows\result.txt
echo ================================================================

pause