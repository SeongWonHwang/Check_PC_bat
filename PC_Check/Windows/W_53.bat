@echo off

:: C:\result ������ �������� ������ ����
if not exist C:\result\Windows mkdir C:\result\Windows
if not exist C:\result\Windows\export mkdir C:\result\Windows\export

echo ================================================================
echo W-53: ���ʿ��� ������ ���� �α׿��� ��� ���� ����
echo ================================================================

secedit /export /cfg C:\result\Windows\export\export.inf >nul 2>&1

:: SeRemoteShutdownPrivilege SID �� ã��
type C:\result\Windows\export\export.inf | find /i "SeInteractiveLogonRight" > C:\result\Windows\export\W_53.txt

echo Administrator SID ��: *S-1-5-32-544"
echo ================================================================
    echo Administrators, IUSR_ ������ ���� ��: �� ��� : ��ȣ
    echo Administrators, IUSR_ �� �ٸ� ���� �� �׷��� �����ϴ� ���: �� ��� : ���
echo ================================================================
echo �� ���� ���� 
echo W-53,���� >> C:\result\Windows\result.txt
echo ================================================================

del C:\result\Windows\export\export.inf

pause