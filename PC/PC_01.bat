@echo off

:: C:\result\PC\export ������ ������ ����
if not exist C:\result\PC mkdir C:\result\PC\export

echo ================================================================
echo PC-01: �ִ� ��ȣ ���Ⱓ�� "90��" ���Ϸ� �����Ǿ� �ִ��� ����
echo ================================================================

:: �ִ� ��ȣ ��� �Ⱓ�� CMD â�� ����ϰ�, C:\result\PC\export\PC_01.txt ���Ϸ� ���
net accounts | find "�ִ� ��ȣ ��� �Ⱓ"
net accounts | find "Maximum password age"
net accounts | find "�ִ� ��ȣ ��� �Ⱓ" > C:\result\PC\export\PC_01.txt

:: PC_01.txt ���Ͽ��� �ִ� ��ȣ ��� �Ⱓ ���� �����Ͽ� ���� PC_01�� ����
for /f "tokens=6" %%a in (C:\result\PC\export\PC_01.txt) do set PC_01=%%a 
echo ================================================================

:: ���� PC_01�� ���� 90�� �ʰ��ϸ� "���", 90 �����̸� "��ȣ"�� �Ǵ��Ͽ� ����� C:\result\PC\result.txt ���Ͽ� ���
if %PC_01% GTR 90 (
    echo �� ��� : ���
    echo PC-01,�Ҹ��� >> C:\result\PC\result.txt
    goto PC1
)

echo �� ��� : ��ȣ
echo PC-01,���� >> C:\result\PC\result.txt
echo ================================================================
:PC1
pause