@echo off

:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-72: DoS ���� ��� ������Ʈ�� ���� ���� ����
echo ================================================================

:: �ʱ� result ���� ������� ����
set result=���

reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" > C:\result\Windows\export\W_72.txt 2>&1

:: ������Ʈ�� ���� �����ϰ� ������ �Ҵ�
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "SynAttackProtect" ^| findstr "SynAttackProtect"') do (
    set SynAttackProtectValue=%%A
)

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "KeepAliveTime" ^| findstr "KeepAliveTime"') do (
    set KeepAliveTimeValue=%%A
)

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableDeadGWDetect" ^| findstr "EnableDeadGWDetect"') do (
    set EnableDeadGWDetectValue=%%A
)

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "NoNameReleaseOnDemand" ^| findstr "NoNameReleaseOnDemand"') do (
    set NoNameReleaseOnDemandValue=%%A
)

echo SynAttackProtect: %SynAttackProtectValue%
echo EnableDeadGWDetect: %EnableDeadGWDetectValue%
echo KeepAliveTime: %KeepAliveTimeValue%
echo NoNameReleaseOnDemand: %NoNameReleaseOnDemandValue%
    
if defined SynAttackProtectValue if "%SynAttackProtectValue%" GEQ "0x1" (
    if defined EnableDeadGWDetectValue if "%EnableDeadGWDetectValue%" equ "0x0" (
        if defined KeepAliveTimeValue if "%KeepAliveTimeValue%" equ "0x493e0" (
            if defined NoNameReleaseOnDemandValue if "%NoNameReleaseOnDemandValue%" equ "0x1" (
                set result=��ȣ
            )
        )
    )
)

echo ================================================================

:: ��� ���
if %result%==��� (
    echo W-72,�Ҹ��� >> C:\result\Windows\result.txt
    echo �� ��� : ���
) else (
    echo W-72,�Ҹ��� >> C:\result\Windows\result.txt
    echo �� ��� : ��ȣ
)

echo ================================================================
pause