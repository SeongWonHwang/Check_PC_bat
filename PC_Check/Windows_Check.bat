@echo off
setlocal enabledelayedexpansion

if exist C:\result\Windows\result.txt del C:\result\Windows\result.txt


set "folderPath=%~dp0Windows"
set "outputFile=%~dp0result_Windows.csv"

for %%f in ("%folderPath%\*.bat") do (
    echo. | call "%%f" >nul 2>&1
)

:: result.txt ������ ��ġ ������ �ִ� ������ result.csv�� ����
type C:\result\Windows\result.txt > "%outputFile%"
type C:\result\Windows\result.txt

:: ����� ������ CSV ���� ��� ����
set "outputexport=%~dp0export_windows.csv"

:: ���� CSV ������ ������ ����
if exist "%outputexport%" del "%outputexport%"

:: CSV ���Ͽ� ��� �߰�
echo Title,Content > "%outputexport%"

:: �ؽ�Ʈ ������ �ִ� ���� ��� ����
set "folderPath=C:\result\Windows\export\"

:: ���� ���� ��� �ؽ�Ʈ ������ ó��
for %%f in ("%folderPath%*.txt") do (
    set "filename=%%~nf"
    set "content="
    
    :: �ؽ�Ʈ ������ ������ ������ ���� (�� �ٷ�)
    for /f "delims=" %%a in (%%f) do (
        set "content=!content! %%a"
    )
    
    :: ����� ������ CSV ���Ͽ� �߰� (���� �� ��ǥ ����)
    echo !filename!,!content:,=,! >> "%outputexport%"
)

echo ���� ��� Ȯ��: %outputFile%\result
echo ��ȣ, ��� ����: %outputexport%\result_Windows

pause