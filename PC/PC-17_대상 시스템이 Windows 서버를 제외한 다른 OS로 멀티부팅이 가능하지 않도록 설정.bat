@echo off
:: C:\result ������ �������� ������ ����
if not exist C:\result\PC mkdir C:\result\PC\export

echo ================================================================
echo PC-17: ����� PC�� �ϳ��� OS�� ��ġ�Ǿ� �ִ��� ����
echo ================================================================

set loaderCount=0

bcdedit /enum > C:\result\PC\export\PC_17.txt

:: C ����̺��� �ؽ�Ʈ ���Ͽ��� "Windows ���� �δ�" �׸��� �˻�
if %ERRORLEVEL% equ 0 (
    findstr /r /c:"Windows ���� �δ�" C:\result\PC\export\PC_17.txt >nul
    if %ERRORLEVEL% equ 0 (
        set /a loaderCount+=1
    )
)

:: ���� �δ� �׸� ���� ���
echo Number of boot loaders found: %loaderCount%

if %loaderCount%==1 (
    echo PC-17,���� >> C:\result\PC\result.txt
    echo �� ��� : ��ȣ
) else (
    echo PC-17,�Ҹ��� >> C:\result\PC\result.txt
    echo �� ��� : ���
)

		echo ================================================================
pause