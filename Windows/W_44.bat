@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-44: ������ �̿� NTFS �̵�� ���� �� ������ ��� ���� ����
echo ================================================================

:: �ʱ� result ���� 1���� ���� (��ȣ)
set result=1

:: AllocateDASDValue �ʱ�ȭ
set AllocateDASDValue=

:: ������Ʈ�� ���� �����ϰ� ����� ���Ͽ� ����
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" > C:\result\Windows\export\W_44.txt 2>&1

:: AllocateDASD ���� ����
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AllocateDASD" ^| findstr "AllocateDASD"') do set AllocateDASDValue=%%A
echo AllocateDASD ��: %AllocateDASDValue%

:: AllocateDASDValue�� "0"�� �ƴ� ��쿡�� ������� ����
if defined AllocateDASDValue (
    if not "%AllocateDASDValue%"=="0" (
        set result=0
    )
)

echo ================================================================

:: ��� ���
if %result%==1 (
    echo ��ġ: �̵��� �̵�� ���� �� ������ ���: ��ȣ
    echo W-44,���� >> C:\result\Windows\result.txt
    echo �� ��� : ��ȣ 
) else (
    echo echo ��ġ: �̵��� �̵�� ���� �� ������ ���: ���
    echo W-44,�Ҹ��� >> C:\result\Windows\result.txt
    echo �� ��� : ���
)

echo ================================================================
pause