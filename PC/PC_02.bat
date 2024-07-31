@echo off

:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\PC mkdir C:\result\PC\export

echo ================================================================
echo PC-02: 패스워드 설정 정책이 복잡성을 만족하는지 점검
echo ================================================================
net accounts | find "최소 암호 길이" 
net accounts | find "Minimum password length" 
net accounts | find "최소 암호 길이" > C:\result\PC\export\PC_02.txt
for /f "tokens=4" %%a in (C:\result\PC\export\PC_02.txt) do set PC_02=%%a 
echo ================================================================

if %PC_02% LSS 8 (
	echo ※ 결과 : 취약
	echo PC-02,불만족 >> C:\result\PC\result.txt
	goto PC2
	)
	
	echo ※ 결과 : 양호
	echo PC-02,만족 >> C:\result\PC\result.txt
echo ================================================================	
:PC2
	
pause