@echo off

:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\PC mkdir C:\result\PC\export

echo ================================================================
echo PC-02: �н����� ���� ��å�� ���⼺�� �����ϴ��� ����
echo ================================================================
net accounts | find "�ּ� ��ȣ ����" 
net accounts | find "Minimum password length" 
net accounts | find "�ּ� ��ȣ ����" > C:\result\PC\export\PC_02.txt
for /f "tokens=4" %%a in (C:\result\PC\export\PC_02.txt) do set PC_02=%%a 
echo ================================================================

if %PC_02% LSS 8 (
	echo �� ��� : ���
	echo PC-02,�Ҹ��� >> C:\result\PC\result.txt
	goto PC2
	)
	
	echo �� ��� : ��ȣ
	echo PC-02,���� >> C:\result\PC\result.txt
echo ================================================================	
:PC2
	
pause