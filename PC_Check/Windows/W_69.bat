@echo off

:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_69.txt del C:\result\Windows\export\W_69.txt

echo ================================================================
echo W-69: 정책에 따른 시스템 로깅 설정
echo ================================================================

:: 보안 정책을 inf 파일로 내보냅니다.
secedit /export /cfg C:\result\Windows\export\export.inf /areas SECURITYPOLICY >nul 2>&1

type C:\result\Windows\export\export.inf | Find /I "AuditLogonEvents" 
type C:\result\Windows\export\export.inf | Find /I "AuditPrivilegeUse" 
type C:\result\Windows\export\export.inf | Find /I "AuditPolicyChange" 
type C:\result\Windows\export\export.inf | Find /I "AuditAccountManage" 
type C:\result\Windows\export\export.inf | Find /I "AuditDSAccess" 
type C:\result\Windows\export\export.inf | Find /I "AuditAccountLogon" 

type C:\result\Windows\export\export.inf | Find /I "AuditLogonEvents" >> C:\result\Windows\export\W_69.txt
type C:\result\Windows\export\export.inf | Find /I "AuditPrivilegeUse" >> C:\result\Windows\export\W_69.txt
type C:\result\Windows\export\export.inf | Find /I "AuditPolicyChange" >> C:\result\Windows\export\W_69.txt
type C:\result\Windows\export\export.inf | Find /I "AuditAccountManage" >> C:\result\Windows\export\W_69.txt
type C:\result\Windows\export\export.inf | Find /I "AuditDSAccess" >> C:\result\Windows\export\W_69.txt
type C:\result\Windows\export\export.inf | Find /I "AuditAccountLogon" >> C:\result\Windows\export\W_69.txt
echo ================================================================
echo 값: 0 - 감사 안함
echo     1 - 성공
echo	    2 - 실패
echo ================================================================
echo 아래와 같은 이벤트에 대한 감사 설정이 되어 있는 경우
echo - 로그온 이벤트, 계정 로그온 이벤트, 정책 변경: 성공/실패 감사
echo - 계정 관리, 디렉토리 서비스 액세스, 권한 사용: 실패 감사 : 
echo ※ 결과: 양호
echo ================================================================
echo 아래와 같은 이벤트에 대한 감사 설정이 되어 있지 않은 경우 (일부 정책만 설정된 경우) : 
echo ※ 결과: 취약
echo ================================================================
echo ※ 수동 점검 
echo W-69,보류 >> C:\result\Windows\result.txt
echo ================================================================

pause