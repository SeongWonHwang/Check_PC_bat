@echo off

:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-78: ���� ä�� ������ ������ ��ȣȭ �Ǵ� ���� ��å ������ ����
echo ================================================================

:: �ʱ� result ���� ������� ����
set result=���
set use=��� ����

reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" > C:\result\Windows\export\W_78.txt 2>&1

:: ������Ʈ�� ���� �����ϰ� ������ �Ҵ�
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" /v "RequireSignOrSeal" ^| findstr "RequireSignOrSeal"') do (
    set RequireSignOrSealValue=%%A
)

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" /v "SealSecureChannel" ^| findstr "SealSecureChannel"') do (
    set SealSecureChannelValue=%%A
)

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" /v "SignSecureChannel" ^| findstr "SignSecureChannel"') do (
    set SignSecureChannelValue=%%A
)
    
if defined RequireSignOrSealValue if "%RequireSignOrSealValue%" equ "0x1" (
    if defined SignSecureChannelValue if "%SignSecureChannelValue%" equ "0x1" (
        if defined SealSecureChannelValue if "%SealSecureChannelValue%" equ "0x1" (            
                set result=��ȣ
set use=���				
        )
    )
)

echo ������ ������: ���� ä�� �����͸� ������ ����: %use%
echo ������ ������: ���� ä�� �����͸� ������ ��ȣȭ �Ǵ� ����: %use%
echo ������ ������: ���� ä�� �����͸� ������ ��ȣȭ: %use%

echo ================================================================

:: ��� ���
if %result%==��� (
    echo W-78,�Ҹ��� >> C:\result\Windows\result.txt
    echo �� ��� : ���
) else (
    echo W-78,�Ҹ��� >> C:\result\Windows\result.txt
    echo �� ��� : ��ȣ
)

echo ================================================================
pause