@echo off
:: C:\result ������ �������� ������ ����
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-41: ���� ���縦 �α��� �� ���� ��� ��� �ý��� ����
echo ================================================================

reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" > C:\result\Windows\export\W_41.txt 2>&1

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v "crashonauditfail" ^| findstr "crashonauditfail"') do set crashonauditfailValue=%%A

if "%crashonauditfailValue%"=="0x0" (
echo ����: ���� ���縦 �α��� �� ���� ��� ��� �ý��� ���� �Ӽ� : ��� ����
) else (
echo ����: ���� ���縦 �α��� �� ���� ��� ��� �ý��� ���� �Ӽ� : ���
)
echo ================================================================

if "%crashonauditfailValue%"=="0x0" (
    echo W-41,���� >> C:\result\Windows\result.txt
    echo �� ��� : ��ȣ 
) else (
    echo W-41,�Ҹ��� >> C:\result\Windows\result.txt
    echo �� ��� : ���
)

echo ================================================================
pause