@echo off

:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-37: SAM ���� ���� ���� ���� ���� ����
echo ================================================================

:: ������ Ȯ���� �����̳� ���͸� ��θ� �����Ͻʽÿ�.
set TARGET_PATH=C:\Windows\System32\config\SAM

:: ����� ������ ���� ��θ� �����Ͻʽÿ�.
set OUTPUT_FILE=C:\result\Windows\export\W_37.txt

:: ���� ������ �ӽ� ���Ͽ� �����ϰ� ���ʿ��� �޽����� �����մϴ�.
icacls %TARGET_PATH% > temp_permissions.txt 2>nul

:: "������ ó��������..."�� ���õ� ���� ����
for /f "tokens=*" %%i in (temp_permissions.txt) do (
    echo %%i | findstr /v /c:"������ ó��������" >> filtered_permissions.txt
)

:: ������ ���� ������ CMD â�� ���
echo %TARGET_PATH%�� ���� ����:
type filtered_permissions.txt

:: ���� ���� ���͸�: SYSTEM�� Administrators�� �ִ��� Ȯ��
findstr /v /c:"BUILTIN\Administrators" /c:"NT AUTHORITY\SYSTEM" filtered_permissions.txt > non_standard_permissions.txt

echo ================================================================

:: ��ǥ�� ������ �ִ��� ���θ� Ȯ���Ͽ� ����� ó��
if %errorlevel%==1 (
    echo W-37,���� >> C:\result\Windows\result.txt
    echo �� ��� : ��ȣ
) else (
    echo W-37,�Ҹ��� >> C:\result\Windows\result.txt
    echo �� ��� : ���
)

echo ================================================================

:: �ӽ� ���� ����
del temp_permissions.txt
del filtered_permissions.txt
del non_standard_permissions.txt

pause