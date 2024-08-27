@echo off

:: C:\result 폴더가 존재하지 않으면 생성합니다.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_69.txt del C:\result\Windows\export\W_69.txt

echo ================================================================
echo W-05: 해독 가능한 암호화 사용 여부 점검
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


pause