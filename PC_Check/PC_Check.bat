@echo off
setlocal enabledelayedexpansion

if exist C:\result\PC\result.txt del C:\result\PC\result.txt

set "folderPath=%~dp0PC"
set "outputFile=%~dp0result_PC.csv"

for %%f in ("%folderPath%\*.bat") do (
    echo. | call "%%f" >nul 2>&1
)

:: result.txt 내용을 배치 파일이 있는 폴더에 result.csv로 저장
type C:\result\PC\result.txt > "%outputFile%"
type C:\result\PC\result.txt

:: 결과를 저장할 CSV 파일 경로 설정
set "outputexport=%~dp0export_PC.csv"

:: 기존 CSV 파일이 있으면 삭제
if exist "%outputexport%" del "%outputexport%"

:: CSV 파일에 헤더 추가
echo Title,Content > "%outputexport%"

:: 텍스트 파일이 있는 폴더 경로 설정
set "folderPath=C:\result\PC\export\"

:: 폴더 안의 모든 텍스트 파일을 처리
for %%f in ("%folderPath%*.txt") do (
    set "filename=%%~nf"
    set "content="
    
    :: 텍스트 파일의 내용을 변수에 저장 (한 줄로)
    for /f "delims=" %%a in (%%f) do (
        set "content=!content! %%a"
    )
    
    :: 제목과 내용을 CSV 파일에 추가 (내용 중 쉼표 제거)
    echo !filename!,!content:,=,! >> "%outputexport%"
)

echo 점검 결과 확인: %outputFile%\result
echo 양호, 취약 점검: %outputexport%\result_PC

pause