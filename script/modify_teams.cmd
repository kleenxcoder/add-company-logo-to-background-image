@ECHO ON

@ECHO ===============================================
@ECHO  2021 Kleenxcoder
@ECHO ===============================================

@SET COMPANY_NAME=%1

@IF "%COMPANY_NAME%"=="" GOTO NO_PARAMETER

@SET TEAMS_LOCATION=%APPDATA%\Microsoft\Teams\Backgrounds
@ECHO %COMPANY_NAME%_*.* > exclude_list.txt

@REM XCOPY /Y %TEAMS_LOCATION%\*.* .\%COMPANY_NAME%_*.* /EXCLUDE:exclude_list.txt
for %%j in (%TEAMS_LOCATION%\*.*) do (
	echo D|XCOPY /Y %%j .\%COMPANY_NAME%_%%~nxj /EXCLUDE:exclude_list.txt
)

@ECHO ===============================================
for /r %%i in (%COMPANY_NAME%_*.*) do (
	.\..\bin\imagemagick\magick ^
	%%i ^
	.\..\image\logo.png ^
	-geometry +2875+300 ^
	-composite ^
	%%i
)
@ECHO ===============================================
@MOVE /Y .\%COMPANY_NAME%_*.* %TEAMS_LOCATION%\

@GOTO EXIT

:NO_PARAMETER
@ECHO Missing company name
@ECHO usage: modify_teams company_name
@ECHO "%~dp0"
@EXIT /B 2

:EXIT