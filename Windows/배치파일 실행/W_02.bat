@echo off

:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-02: Guest ���� ��Ȱ��ȭ ���� ����
echo ================================================================

REM Check if the Guest account is disabled based on "Ȱ�� ����" output
net user guest | findstr /i "Ȱ�� ����" | findstr "��" >nul 2>&1
if %errorlevel% equ 0 (
    echo Guest ���� Ȱ��ȭ��
    echo ================================================================
    echo Guest ���� Ȱ��ȭ�� > C:\result\Windows\export\W_02.txt
    echo W-02,�Ҹ��� >> C:\result\Windows\result.txt
    echo �� ��� : ���
) else (
    echo Guest ���� ��Ȱ��ȭ��
    echo ================================================================
    echo Guest ���� ��Ȱ��ȭ�� > C:\result\Windows\export\W_02.txt
    echo W-02,���� >> C:\result\Windows\result.txt
    echo �� ��� : ��ȣ
)

echo ================================================================

pause