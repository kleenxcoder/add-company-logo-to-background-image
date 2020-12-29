@ECHO ON

@ECHO ===============================================
@ECHO  2021 Kleenxcoder
@ECHO ===============================================

@SET COMPANY_NAME=%1

@IF "%COMPANY_NAME%"=="" GOTO NO_PARAMETER

@SET TEAMS_LOCATION=%APPDATA%\Microsoft\Teams\Backgrounds
@ECHO %COMPANY_NAME%_*.* > exclude_list.txt

@REM copy all files from teams location
for %%j in (%TEAMS_LOCATION%\*.*) do (
	@REM exclude files having company name
	(Echo "%%j" | FIND /I "%COMPANY_NAME%_" 1>NUL) || (
		@REM copy files and add company name as prefix
		echo D|XCOPY /Y  %%j .\%COMPANY_NAME%_%%~nxj
	)
)

@ECHO ===============================================
@REM add logo to image
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