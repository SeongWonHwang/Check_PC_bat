@echo off

:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows
if not exist C:\result\Windows\export mkdir C:\result\Windows\export

echo ================================================================
echo W-40: ���� �ý��� ���� ��å ������ ����
echo ================================================================

:: ���� ��å�� inf ���Ϸ� �������ϴ�.
secedit /export /cfg C:\result\Windows\export\export.inf >nul 2>&1

type C:\result\Windows\export\export.inf | find /i "SeRemoteShutdownPrivilege"

:: SeRemoteShutdownPrivilege ������ ã���ϴ�.
echo Administrator SID ��: *S-1-5-32-544"
echo ================================================================
    echo Administrator ������ ���� ��: �� ��� : ��ȣ
    echo �� ���� �ٸ� ���ʿ��� ���� ���� ��: �� ��� : ���
    echo ���� ���� �ʿ�
echo ================================================================
pause