@echo off

echo ================================================================
echo PC-01: �ִ� ��ȣ ���Ⱓ�� "90��" ���Ϸ� �����Ǿ� �ִ��� ����
echo ================================================================

:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\PC mkdir C:\result\PC\export

net accounts | find "�ִ� ��ȣ ��� �Ⱓ" 
net accounts | find "Maximum password age" 
net accounts | find "�ִ� ��ȣ ��� �Ⱓ" > C:\result\PC\export\PC_01.txt
for /f "tokens=6" %%a in (C:\result\PC\export\PC_01.txt) do set PC_01=%%a 
echo ================================================================

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