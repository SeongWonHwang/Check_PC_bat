@echo off

:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows
if not exist C:\result\Windows\export mkdir C:\result\Windows\export

echo ================================================================
echo W-49: �н����� �ּ� ��ȣ ���� ��å ���� ���� ����
echo ================================================================

:: �ִ� ��ȣ ��� �Ⱓ�� CMD â�� ����ϰ�, C:\result\Windows\export\W_49.txt ���Ϸ� ���
net accounts | find "�ּ� ��ȣ ����"
net accounts | find "Minimum password length"
net accounts | find "�ּ� ��ȣ ����" > C:\result\Windows\export\W_49.txt

echo ================================================================

:: �ּҾ�ȣ ���� ����
for /f "tokens=4" %%a in (C:\result\Windows\export\W_49.txt) do set W_49=%%a 

:: ��� ��
set Result=��ȣ
if %W_49% LSS 8 (
    set Result=���
)

:: ��� ��� �� ����
if "%Result%" equ "��ȣ" (
    echo �� ��� : ��ȣ
    echo W-49,���� >> C:\result\Windows\result.txt
) else (
    echo �� ��� : ���
    echo W-49,�Ҹ��� >> C:\result\Windows\result.txt
)

echo ================================================================

pause