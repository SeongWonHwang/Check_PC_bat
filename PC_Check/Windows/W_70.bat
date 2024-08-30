@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-70: �̺�Ʈ �α� ���� �뷮 �� ���� �Ⱓ ���� ����
echo ================================================================

:: �ʱ� result ���� 1���� ����
set result=1

:: MaxSizeValue ������ �ʱ�ȭ
set MaxSizeValue=

:: ������Ʈ�� ���� �����ϰ� ����� ���Ͽ� ����
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog\Application" > C:\result\Windows\export\W_70.txt 2>&1

:: MaxSize ���� �������� (���� ����)
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog\Application" /v "MaxSize" ^| findstr "MaxSize"') do (
    set MaxSizeValue=%%A
)

:: MaxSize ���� KB ������ ��ȯ (���� �� ��Ÿ ���� ����)
for /f %%A in ("%MaxSizeValue%") do set /a MaxSizeDec=%%A/1024

echo �ִ� �α� ũ�� ��: %MaxSizeDec%KB
    
:: MaxSize ���� �����Ǿ����� Ȯ��
if defined MaxSizeValue (
    if %MaxSizeDec% Lss 10240 (
        set result=0
    )
)

:: Retention ���� �������� (���� ����)
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog\Application" /v "Retention" ^| findstr "Retention"') do (
    set RetentionValue=%%A
)

if "%RetentionValue%" neq "0x0" (
    set result=0
echo �ʿ��� ��� �̺�Ʈ ����� ���� �ȵ�
) else (
echo �ʿ��� ��� �̺�Ʈ ����� ���� ��
)

echo ================================================================

:: ��� ���
if %result%==1 (
    echo W-70,���� >> C:\result\Windows\result.txt
    echo �� ��� : ��ȣ
) else (
    echo W-70,�Ҹ��� >> C:\result\Windows\result.txt
    echo �� ��� : ���
)

echo ================================================================
pause