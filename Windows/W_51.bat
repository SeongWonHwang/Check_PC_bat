@echo off

:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows
if not exist C:\result\Windows\export mkdir C:\result\Windows\export

echo ================================================================
echo W-51: �н����� �ּ� ��� �Ⱓ ��å ���� ���� ����
echo ================================================================

:: �ִ� ��ȣ ��� �Ⱓ�� CMD â�� ����ϰ�, C:\result\Windows\export\W_51.txt ���Ϸ� ���
net accounts | find "�ּ� ��ȣ ��� �Ⱓ"
net accounts | find "Minimum password age"
net accounts | find "�ּ� ��ȣ ��� �Ⱓ" > C:\result\Windows\export\W_51.txt

:: PC_01.txt ���Ͽ��� �ִ� ��ȣ ��� �Ⱓ ���� �����Ͽ� ���� PC_01�� ����
for /f "tokens=6" %%a in (C:\result\Windows\export\W_51.txt) do set W_51=%%a
echo ================================================================

:: ���� W_51�� ���� 0�̸� "���", 1�̻��̸� "��ȣ"�� �Ǵ��Ͽ� ����� C:\result\Windows\result.txt ���Ͽ� ���
if %W_51% == 0 (
    echo �� ��� : ���
    echo W-51,�Ҹ��� >> C:\result\Windows\result.txt
    goto W51
)

echo �� ��� : ��ȣ
echo W-51,���� >> C:\result\Windows\result.txt
echo ================================================================
:W51
pause