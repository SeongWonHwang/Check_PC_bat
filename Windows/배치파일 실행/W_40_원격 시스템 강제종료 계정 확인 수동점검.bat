@echo off

:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows
if not exist C:\result\Windows\export mkdir C:\result\Windows\export

echo ================================================================
echo W-40: 원격 시스템 종료 정책 적절성 점검
echo ================================================================

:: 보안 정책을 inf 파일로 내보냅니다.
secedit /export /cfg C:\result\Windows\export\export.inf >nul 2>&1

type C:\result\Windows\export\export.inf | find /i "SeRemoteShutdownPrivilege"

:: SeRemoteShutdownPrivilege 설정을 찾습니다.
echo Administrator SID 값: *S-1-5-32-544"
echo ================================================================
    echo Administrator 계정만 존재 시: ※ 결과 : 양호
    echo 그 외의 다른 불필요한 계정 존재 시: ※ 결과 : 취약
    echo 수동 점검 필요
echo ================================================================
pause