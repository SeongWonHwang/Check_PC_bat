@echo off
:: C:\result ������ �������� ������ ����
if not exist C:\result\PC mkdir C:\result\PC\export

echo ================================================================
echo PC-11: �ý����� ��ȭ�� ����� Ȱ��ȭ�Ǿ� �ִ��� ����
echo ================================================================

:: �ʱ� result ���� ������� ����
set result=���

:: EnableFirewallValue ������ �ʱ�ȭ
set EnableFirewallValue=

:: ������Ʈ�� �� ��������
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" > C:\result\PC\export\PC_11.txt 2>&1

:: EnableFirewall �� ��������
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v "EnableFirewall" ^| findstr "EnableFirewall"') do set EnableFirewallValue=%%A

:: EnableFirewall ���� �������� ���� ��� ó��
if not defined EnableFirewallValue (
    echo ������Ʈ�� Ű�� �������� ���� >> C:\result\PC\result.txt
    echo ��ȭ�� ���� ����
    echo ================================================================
    echo �� ��� : ���
    goto End
)

:: EnableFirewall �� Ȯ�� �� ��� ����
if "%EnableFirewallValue%"=="0x1" (
    set result=��ȣ
)

echo ================================================================

:: ��� ���
if "%result%"=="���" (
    echo PC-11,�Ҹ��� >> C:\result\PC\result.txt
    echo Windows Defender ��ȭ�� ���: ��� �� ��
    echo ================================================================
    echo �� ��� : ���
) else (
    echo PC-11,���� >> C:\result\PC\result.txt
    echo Windows Defender ��ȭ�� ���: ���
    echo ================================================================
    echo �� ��� : ��ȣ
)

:End
echo ================================================================
pause