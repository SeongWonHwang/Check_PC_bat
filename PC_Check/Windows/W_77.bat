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
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v "LmCompatibilityLevel" 2^>nul ^| findstr "LmCompatibilityLevel"') do set LmCompatibilityLevelValue=%%A

:: LmCompatibilityLevel ���� 0x0�̸� ������� ����
if "%LmCompatibilityLevelValue%"=="0x3" (
echo ��Ʈ��ũ ����: LAN ������ ���� ����: NTLMv2 ���丸 ������
	)
	if "%LmCompatibilityLevelValue%"=="0x0" (
	echo ��Ʈ��ũ ����: LAN ������ ���� ����: LM �� NTLM ���� ������
	)
	if "%LmCompatibilityLevelValue%"=="0x1" (
	echo ��Ʈ��ũ ����: LAN ������ ���� ����: LM �� NTLM ������ - NTLMv2 ���� ���� ���^(����� ���^)
	)
	if "%LmCompatibilityLevelValue%"=="0x2" (
	echo ��Ʈ��ũ ����: LAN ������ ���� ����: NTLM ���丸 ������
	)
	if "%LmCompatibilityLevelValue%"=="0x4" (
	echo ��Ʈ��ũ ����: LAN ������ ���� ����: NTLMv2 ���丸 ������ �� LM �ź�
	)
	if "%LmCompatibilityLevelValue%"=="0x5" (
	echo ��Ʈ��ũ ����: LAN ������ ���� ����: NTLMv2 ���丸 ������ �� LM �� NTLM �ź�
	)	
	if not defined LmCompatibilityLevelValue (
echo ��Ʈ��ũ ����: LAN ������ ���� ����: �������� ����
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