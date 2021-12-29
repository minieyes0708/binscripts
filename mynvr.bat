@SET FULL_NAME=%COMPUTERNAME%-%USERNAME%

@IF %FULL_NAME% == MINIEYESNB1-怡哲 (
    @FOR /F "delims=" %%i IN ('py -m tools.mynvr') DO @SET SERVERNAME=%%i
    @nvr --servername %SERVERNAME% %*
    @GOTO :END
)
@IF %FULL_NAME% == NVT02863_NB-NVT02863 (
    @FOR /F "delims=" %%i IN ('py -m miniLibrary.mynvr') DO @SET SERVERNAME=%%i
    @nvr --servername %SERVERNAME% %*
    @GOTO :END
)
@IF %FULL_NAME% == MINIEYES-PC2-chenv (
    @FOR /F "delims=" %%i IN ('py -m tools.mynvr') DO @SET SERVERNAME=%%i
    @nvr --servername %SERVERNAME% %*
    @GOTO :END
)
@ECHO No matching settings

:END
