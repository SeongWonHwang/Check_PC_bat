@echo off

:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows
if not exist C:\result\Windows\export mkdir C:\result\Windows\export

echo ================================================================
echo W-53: ���ʿ��� ������ ���� �α׿��� ��� ���� ����
echo ================================================================

:: ���� ��å�� inf ���Ϸ� �������ϴ�.
secedit /export /cfg C:\result\Windows\export\export.inf >nul 2>&1

type C:\result\Windows\export\export.inf | find /i "SeInteractiveLogonRight"

:: SeRemoteShutdownPrivilege ������ ã���ϴ�.
echo Administrator SID ��: *S-1-5-32-544"
echo ================================================================
    echo Administrators, IUSR_ ������ ���� ��: �� ��� : ��ȣ
    echo Administrators, IUSR_ �� �ٸ� ���� �� �׷��� �����ϴ� ���: �� ��� : ���
    echo ���� ���� �ʿ�
echo ================================================================
pause