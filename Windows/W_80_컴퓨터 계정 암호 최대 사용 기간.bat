@echo off

:: C:\result ������ �������� ������ ����
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-80: ��ǻ�� ���� ��ȣ �ִ� ��� �Ⱓ ���� ���� ����
echo ================================================================

:: �ʱ� result ���� ������� ����
set result=���
set use=���

reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" > C:\result\Windows\export\W_80.txt 2>&1

:: ������Ʈ�� ���� �����ϰ� ������ �Ҵ�
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" /v "DisablePasswordChange" ^| findstr "DisablePasswordChange"') do (
    set DisablePasswordChangeValue=%%A
)

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" /v "MaximumPasswordAge" ^| findstr "MaximumPasswordAge"') do (
    set MaximumPasswordAgeValue=%%A
)
set /a MaximumPasswordAgeDec=MaximumPasswordAgeValue
    
if defined DisablePasswordChangeValue if "%DisablePasswordChangeValue%" equ "0x0" (
    if defined MaximumPasswordAgeValue if "%MaximumPasswordAgeValue%" LEQ "0x5a" (   

                set result=��ȣ
				set use=��� ����			
    )
)

echo ������ ������: ��ǻ�� ���� ��ȣ ���� ��� �� ��: %use%
echo ������ ������: ��ǻ�� ���� ��ȣ �ִ� ��� �Ⱓ: %MaximumPasswordAgeDec%��

echo ================================================================

:: ��� ���
if %result%==��� (
    echo W-80,�Ҹ��� >> C:\result\Windows\result.txt
    echo �� ��� : ���
) else (
    echo W-80,�Ҹ��� >> C:\result\Windows\result.txt
    echo �� ��� : ��ȣ
)

echo ================================================================
pause