@echo off

:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows
if not exist C:\result\Windows\export mkdir C:\result\Windows\export

echo ================================================================
echo W-53: 불필요한 계정의 로컬 로그온을 허용 여부 점검
echo ================================================================

:: 보안 정책을 inf 파일로 내보냅니다.
secedit /export /cfg C:\result\Windows\export\export.inf >nul 2>&1

type C:\result\Windows\export\export.inf | find /i "SeInteractiveLogonRight"

:: SeRemoteShutdownPrivilege 설정을 찾습니다.
echo Administrator SID 값: *S-1-5-32-544"
echo ================================================================
    echo Administrators, IUSR_ 계정만 존재 시: ※ 결과 : 양호
    echo Administrators, IUSR_ 외 다른 계정 및 그룹이 존재하는 경우: ※ 결과 : 취약
    echo 수동 점검 필요
echo ================================================================
pause