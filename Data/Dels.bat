@Echo Off
:: Batch-CN Dels
::     2014-11-15
SetLocal EnableDelayedExpansion
For /F "Skip=1 Tokens=2,3 Delims=#" %%i In ('Reg Query HKLM\SOFTWARE\Batch-CN /v ProgramPath') Do (
	Set Desktop=%%i
	Set ProgramPath=%%j
)
If "%~1"=="" (
	For %%i In (
		";"
		";��ӡ�����б��ɾ��һ����������"
		";"
		";Dels tool             ��ȡ���ص������б�"
		";Dels soft iBAT        ж��iBAT"
		";Dels exmalpe          ��ȡ����ʾ������/�����б�"
		";Dels update           ��ȡ���ؿ�ѡ�����б�"
	) Do Echo%%~i
	Goto :Eof
)
Call :%~1 %2
If Not "%~2"=="" Echo ɾ�����!
EndLocal
Goto :Eof
:tool
If "%~1"=="" (
	For %%i In ("%ProgramPath%Data\Tools\*.exe") Do Echo %%~nxi
) Else (
	Del "%ProgramPath%Data\Tools\%~1.exe"
)
Goto :Eof
:example
If "%~1"=="" (
	For %%i In ("%ProgramPath%Data\Examples\*") Do Echo %%~nxi
) Else (
	Rd /S /Q "%ProgramPath%Data\Examples\%~1"
)
Goto :Eof
:soft
If "%~1"=="" (
	For /D %%i In ("%ProgramPath%Data\Softs\*") Do Echo %%~nxi
) Else (
	Rd /S /Q "%ProgramPath%Data\Softs\%~1"
	Del "%UserProfile%\%Desktop%\%~1.lnk"
)
Goto :Eof