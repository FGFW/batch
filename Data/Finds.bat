@Echo Off
::Batch-CN Finds
::     2014-10-24
SetLocal EnableDelayedExpansion
For /F "Skip=1 Tokens=3 Delims=#" %%i In ('Reg Query HKLM\SOFTWARE\Batch-CN /v ProgramPath') Do Set ProgramPath=%%i
If "%~1"=="" (
	For %%i In (
		";"
		";���б��������ؼ���(�ؼ�����Get-�����²�����ʾ)"
		";"
		";��:"
		";Find tool ע���      �ڵ������б������������ؼ���"ע���"������"
		";Find soft �༭        ������б������������ؼ���"�༭"������"
		";Find example CAPI     ��ʾ������/�����б������������ؼ���"CAPI"������"
		";Find update ������    �ڿ�ѡ���������������ؼ���"������"������"
	) Do Echo%%~i
	Goto :Eof
)
If "%~2"=="" (
	EndLocal
	Goto :Eof
)
If Not Exist "%ProgramPath%Data\Lists\%~1.txt" (
	wget -O "%ProgramPath%Data\Lists\%~1.txt" -q "http://batch-cn.qiniudn.com/list/%~1.txt"
)
Echo ����          �汾     ��С    ���
For /F "Tokens=1,2,3,4" %%i In ('Findstr /I "%~2" "%ProgramPath%Data\Lists\%~1.txt"') Do (
	Set Str=%%i                              
	Set Str2=%%j                        
	Set Size=%%l     
	Set /A Times+=1
	Echo !Str:~0,14!!Str2:~0,9!!Size:~0,8!%%k
	If !Times!==23 (
		Pause>nul
		Set Times=
	)
)
EndLocal