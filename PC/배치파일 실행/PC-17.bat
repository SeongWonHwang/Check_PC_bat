@echo off
:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\PC mkdir C:\result\PC\export

echo ================================================================
echo PC-17: ����� PC�� �ϳ��� OS�� ��ġ�Ǿ� �ִ��� ����
echo ================================================================

REM loaderCount ������ �ʱ�ȭ�մϴ�.
set loaderCount=0

REM bcdedit ��� ����� C ����̺��� �ؽ�Ʈ ���Ͽ� �����մϴ�.
bcdedit /enum > C:\result\PC\export\PC_17.txt

REM C ����̺��� �ؽ�Ʈ ���Ͽ��� "Windows ���� �δ�" �׸��� �˻��Ͽ� ������ ���ϴ�.
if %ERRORLEVEL% equ 0 (
    findstr /r /c:"Windows ���� �δ�" C:\result\PC\export\PC_17.txt >nul
    if %ERRORLEVEL% equ 0 (
        set /a loaderCount+=1
    )
)

REM ���� �δ� �׸� ���� ����մϴ�.
echo Number of boot loaders found: %loaderCount%

REM ���� �δ� �׸��� �� ���� �� ����, �ƴ� �� �Ҹ����� ����մϴ�.
if %loaderCount%==1 (
    echo PC-17,���� >> C:\result\PC\result.txt
    echo �� ��� : ��ȣ
) else (
    echo PC-17,�Ҹ��� >> C:\result\PC\result.txt
    echo �� ��� : ���
)

echo ================================================================
pause