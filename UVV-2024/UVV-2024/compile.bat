@ECHO OFF
timeout 1
@call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\Tools\VsDevCmd.bat" -no_ext -winsdk=none %*
cd "./Debug/"
UVV.exe -in:in.txt -out:asm.asm -log:log.txt

@echo.
@echo.

@chcp 1251 >nul
@Choice /M "Вывести log?"
@echo.
@If Errorlevel 2 Goto No
@If Errorlevel 1 Goto Yes
@Goto End

:No
@Goto End

:Yes

@echo.
@echo.

@echo Вывод содержимого log-файла:
@type "./in.txt.log"

@pause

:End
timeout 5
pause
exit