@Echo Off
Title Batch-CN ��װ/ж�س���
Echo Test>>"%SystemRoot%\System32\Test.bat"
If Not Exist "%SystemRoot%\System32\Test.bat" (
	Echo ���Թ���Ա�������!
	Pause
	Exit
)
Del "%SystemRoot%\System32\Test.bat">nul
SetLocal EnableDelayedExpansion
Set Desktop=Desktop
Set Pat=%~dp0
Ver|findstr "5\.[1-9]\.[1-9]*"&&(
	Set Desktop=����
	Set Pat=%CD%\
)
:Menu
Echo ��ѡ������:
Echo;
Echo N - ��ͨ��װ     ��װ�󴴽�һ�������ݷ�ʽ,ͨ����ݷ�ʽ����Batch-CN
Echo E - Ƕ��ʽ��װ   ��װ��Ƕ�뵽cmd����,������cmd������Batch-CN����
Echo U - ж��         ɾ��Batch-CN��ע������뻷������,֮�����ֱ��ɾ��Batch-CNĿ¼
Echo;
Echo   ע:Ĭ�ϰ�װ�ڵ�ǰĿ¼!
Echo;
Set /P Choice=��ѡ��:
If /I "%Choice%"=="N" Goto Normal
If /I "%Choice%"=="E" Goto Normal
If /I "%Choice%"=="U" Goto Uninstall
Cls
Goto Menu
:Normal
Reg Add HKLM\SOFTWARE\Batch-CN /f
Reg Add HKLM\SOFTWARE\Batch-CN /v "Version" /t REG_SZ /d "3.2" /f
Reg Add HKLM\SOFTWARE\Batch-CN /v "ProgramPath" /t REG_SZ /d "#%Desktop%#%Pat%#" /f
If /I "%Choice%"=="E" (
	Reg Add "HKLM\SOFTWARE\Microsoft\Command Processor" /v "AutoRun" /t REG_SZ /d "Doskey /MacroFile=\"%Pat%Data\Keyword-Base.dic\"&Path %Pat%Data;%Pat%Data\Tools;%%Path%%" /f
) Else (
	"%Pat%Data\Tools\ShortCut.exe" /F:"%UserProFile%\%Desktop%\Batch-CN.lnk" /A:C /T:"cmd.exe" /P:"/K \"%Pat%Batch-CN.bat\"" /I:"cmd.exe"
)
Echo ��װ��ɣ�
Goto End
:Uninstall
Reg Delete HKLM\SOFTWARE\Batch-CN /f 2>nul
Reg Delete "HKLM\SOFTWARE\Microsoft\Command Processor" /v "AutoRun" /f 2>nul
Del "%UserProFile%\%Desktop%\Batch-CN.lnk" 2>nul
Echo ж����ɣ�
:End
Echo ������˳�...
Pause>nul