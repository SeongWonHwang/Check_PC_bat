@echo off

:: C:\result ������ �������� ������ �����մϴ�.
if not exist C:\result\Windows mkdir C:\result\Windows\export

if exist C:\result\Windows\export\W_69.txt del C:\result\Windows\export\W_69.txt

echo ================================================================
echo W-05: �ص� ������ ��ȣȭ ��� ���� ����
echo ================================================================

:: ���� ��å�� inf ���Ϸ� �������ϴ�.
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
echo ��: 0 - ���� ����
echo     1 - ����
echo	    2 - ����
echo ================================================================


pause