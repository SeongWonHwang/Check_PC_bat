@echo off
:: C:\result\Windows\export 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows\export mkdir C:\result\Windows\export

:: 이전 W_77.txt 파일을 삭제
if exist C:\result\Windows\export\W_77.txt del C:\result\Windows\export\W_77.txt

echo ================================================================
echo W-74: 세션 연결 중단 시 유휴시간 설정 여부 점검
echo ================================================================

:: 레지스트리 값 쿼리
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" > C:\result\Windows\export\W_77.txt 2>&1

:: LmCompatibilityLevel 값 가져오기
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v "LmCompatibilityLevel" 2^>nul ^| findstr "LmCompatibilityLevel"') do set LmCompatibilityLevelValue=%%A

:: LmCompatibilityLevel 값이 0x0이면 취약으로 설정
if "%LmCompatibilityLevelValue%"=="0x3" (
echo 네트워크 보안: LAN 관리자 인증 수준: NTLMv2 응답만 보내기
	)
	if "%LmCompatibilityLevelValue%"=="0x0" (
	echo 네트워크 보안: LAN 관리자 인증 수준: LM 및 NTLM 응답 보내기
	)
	if "%LmCompatibilityLevelValue%"=="0x1" (
	echo 네트워크 보안: LAN 관리자 인증 수준: LM 및 NTLM 보내기 - NTLMv2 세션 보안 사용^(협상된 경우^)
	)
	if "%LmCompatibilityLevelValue%"=="0x2" (
	echo 네트워크 보안: LAN 관리자 인증 수준: NTLM 응답만 보내기
	)
	if "%LmCompatibilityLevelValue%"=="0x4" (
	echo 네트워크 보안: LAN 관리자 인증 수준: NTLMv2 응답만 보내기 및 LM 거부
	)
	if "%LmCompatibilityLevelValue%"=="0x5" (
	echo 네트워크 보안: LAN 관리자 인증 수준: NTLMv2 응답만 보내기 및 LM 및 NTLM 거부
	)	
	if not defined LmCompatibilityLevelValue (
echo 네트워크 보안: LAN 관리자 인증 수준: 구성되지 않음
	)
)

echo ================================================================

:: 결과에 따라 파일에 기록
if "%LmCompatibilityLevelValue%"=="0x3" (
    echo W-77,만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 양호
) else (
    echo W-77,불만족 >> C:\result\Windows\result.txt
    echo ※ 결과 : 취약
)

echo ================================================================
pause