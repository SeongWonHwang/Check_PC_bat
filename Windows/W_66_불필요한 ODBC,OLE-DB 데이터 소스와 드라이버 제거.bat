@echo off
:: C:\result\Windows\export ������ �������� ������ ����
if not exist C:\result\Windows\export mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_66.txt del C:\result\Windows\export\W_66.txt

echo ================================================================
echo W-66: ���ʿ��� ODBC/OLE-DB ������ �ҽ��� ����̺� ���� ���� ����
echo ================================================================

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\ODBC Data Sources" > C:\result\Windows\export\W_66.txt 2>&1

:: ������Ʈ�� ���� ������ �ӽ� ����
setlocal
set "output="
for /f "tokens=*" %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\ODBC Data Sources" 2^>nul') do (
    set "output=%%i"
    echo %%i>C:\result\Windows\export\W_66.txt
)

type C:\result\Windows\export\W_66.txt
:: ������ ��� �ִ��� Ȯ���Ͽ� ��� ó��
if defined output (
    echo ================================================================
    echo W-66,�Ҹ��� >> C:\result\Windows\result.txt
    echo �� ��� : ���
) else (
    echo ================================================================
    echo W-66,���� >> C:\result\Windows\result.txt
    echo �� ��� : ��ȣ
)

endlocal
echo ================================================================
pause