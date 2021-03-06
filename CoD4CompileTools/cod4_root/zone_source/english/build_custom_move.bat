@echo off

set LANG=%1
shift

echo CONSOLESTATUS:BUILD FASTFILES / COPY TO USERMAPS
echo.

IF EXIST ..\zone_source\%1_load.csv (
	SET MYFASTFILES=%1 %1_load %2 %3 %4 %5 %6 %7 %8 %9
) ELSE (
	SET MYFASTFILES=%1 %2 %3 %4 %5 %6 %7 %8 %9
)

linker_pc.exe -language english %MYFASTFILES%

chdir ..\zone\
set DIR_ENG=%CD%\english
set DIR_LANG=%CD%\%LANG%

chdir ..\usermaps\
set DIR_USERMAPS=%CD%\%1
set USERMAP=%1

IF NOT EXIST "%USERMAP%" (
	echo Folder "%1" not found, creating ...
	mkdir "%USERMAP%"
)

IF EXIST "%DIR_ENG%\%1.ff" (	    
	COPY "%DIR_ENG%\%1.ff" "%DIR_USERMAPS%\%1.ff"		
	//echo ++ moved "%1.ff" to usermaps
)

IF EXIST "%DIR_ENG%\%1_load.ff" (
	COPY "%DIR_ENG%\%1_load.ff" "%DIR_USERMAPS%\%1_load.ff" 
	//echo ++ moved "%1_load.ff" to usermaps
)

IF NOT "%LANG%" == "english" (
	echo language is not english
	echo copy to usermaps only supported on english version
	echo copying fast files to %LANG% folder
	mkdir %DIR_LANG%
	IF EXIST "%DIR_ENG%\%1.ff"	move "%DIR_ENG%\%1.ff" "%DIR_LANG%\%1.ff"
	IF EXIST "%DIR_ENG%\%1_load.ff"	move "%DIR_ENG%\%1_load.ff" "%DIR_LANG%\%1_load.ff"
	IF EXIST "%DIR_ENG%\%2.ff"	move "%DIR_ENG%\%2.ff" "%DIR_LANG%\%2.ff"
	IF EXIST "%DIR_ENG%\%3.ff"	move "%DIR_ENG%\%3.ff" "%DIR_LANG%\%3.ff"
	IF EXIST "%DIR_ENG%\%4.ff"	move "%DIR_ENG%\%4.ff" "%DIR_LANG%\%4.ff"
	IF EXIST "%DIR_ENG%\%5.ff"	move "%DIR_ENG%\%5.ff" "%DIR_LANG%\%5.ff"
	IF EXIST "%DIR_ENG%\%6.ff"	move "%DIR_ENG%\%6.ff" "%DIR_LANG%\%6.ff"
	IF EXIST "%DIR_ENG%\%7.ff"	move "%DIR_ENG%\%7.ff" "%DIR_LANG%\%7.ff"
	IF EXIST "%DIR_ENG%\%8.ff"	move "%DIR_ENG%\%8.ff" "%DIR_LANG%\%8.ff"
	IF EXIST "%DIR_ENG%\%9.ff"	move "%DIR_ENG%\%9.ff" "%DIR_LANG%\%9.ff"
)
