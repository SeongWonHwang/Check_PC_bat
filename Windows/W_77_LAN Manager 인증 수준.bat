@echo off
:: C:\result\Windows\export ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows\export mkdir C:\result\Windows\export

:: ���� W_77.txt ������ ����
if exist C:\result\Windows\export\W_77.txt del C:\result\Windows\export\W_77.txt

echo ================================================================
echo W-74: ���� ���� �ߴ� �� ���޽ð� ���� ���� ����
echo ================================================================

:: ������Ʈ�� �� ����
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" > C:\result\Windows\export\W_77.txt 2>&1

:: LmCompatibilityLevel �� ��������
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v "LmCompatibilityLevel" ^| findstr "LmCompatibilityLevel"') do set LmCompatibilityLevelValue=%%A

echo ================================================================

:: LmCompatibilityLevel ���� 0x0�̸� ������� ����
if "%LmCompatibilityLevelValue%"=="0x3" (
echo NTLMv2 ���丸 ������ ������
	)
)

echo ================================================================

:: ����� ���� ���Ͽ� ���
if "%LmCompatibilityLevelValue%"=="0x3" (
    echo W-77,���� >> C:\result\Windows\result.txt
    echo �� ��� : ��ȣ
) else (
    echo W-77,�Ҹ��� >> C:\result\Windows\result.txt
    echo �� ��� : ���
)

echo ================================================================
pause