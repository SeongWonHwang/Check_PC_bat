@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-39: ��α׿� ������� �ý��� ���� ��� ���� ����
echo ================================================================

:: Query the registry value and write to the file
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" > C:\result\Windows\export\W_41.txt 2>&1

:: Display only the ShutdownWithoutLogon value from the registry query
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v "crashonauditfail" ^| findstr "crashonauditfail"') do set crashonauditfailValue=%%A
echo crashonauditfail ��: %crashonauditfailValue%

if "%crashonauditfailValue%"=="0x0" (
echo ����: ���� ���縦 �α��� �� ���� ��� ��� �ý��� ���� �Ӽ� : ��� ����
) else (
echo ����: ���� ���縦 �α��� �� ���� ��� ��� �ý��� ���� �Ӽ� : ���
)
echo ================================================================

:: Check the crashonauditfail value
if "%crashonauditfailValue%"=="0x0" (
    echo W-41,���� >> C:\result\Windows\result.txt
    echo �� ��� : ��ȣ 
) else (
    echo W-41,�Ҹ��� >> C:\result\Windows\result.txt
    echo �� ��� : ���
)

echo ================================================================
pause