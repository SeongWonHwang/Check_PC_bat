@echo off
:: C:\result ������ �������� ������ ����
if not exist C:\result\Windows mkdir C:\result\Windows\export

echo ================================================================
echo W-44: ������ �̿� NTFS �̵�� ���� �� ������ ��� ���� ����
echo ================================================================

:: �ʱ� result ���� ���
set result=���

:: AllocateDASDValue �ʱ�ȭ
set AllocateDASDValue=

:: ������Ʈ�� ���� �����ϰ� ����� ���Ͽ� ����
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" > C:\result\Windows\export\W_44.txt 2>&1


:: AllocateDASD ���� ����
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AllocateDASD" 2^>nul ^| findstr "AllocateDASD"') do set AllocateDASDValue=%%A

:: AllocateDASDValue�� "0"�� �ƴ� ��쿡�� ������� ����
if not defined AllocateDASDValue (
    echo W-44,�Ҹ��� >> C:\result\Windows\result.txt
    echo ================================================================
	echo �̵��� �̵�� ���� �� ������ ���: �������� ����
	    echo ================================================================
    echo �� ��� : ���
    goto End
    )
)

if "%AllocateDASDValue%"=="0" (
set result=��ȣ
)

echo ================================================================

:: ��� ���
if "%result%"=="��ȣ" (
    echo ��ġ: �̵��� �̵�� ���� �� ������ ���: Adiministrators
	echo ================================================================
    echo W-44,���� >> C:\result\Windows\result.txt
    echo �� ��� : ��ȣ 
) else (
    echo echo ��ġ: �̵��� �̵�� ���� �� ������ ���: Adiministrators �� �ٸ�����
	echo ================================================================
    echo W-44,�Ҹ��� >> C:\result\Windows\result.txt
    echo �� ��� : ���
)

:End
echo ================================================================
pause