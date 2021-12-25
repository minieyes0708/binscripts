@SET FULL_NAME=%COMPUTERNAME%-%USERNAME%

@FOR /F "delims=" %%i IN ('py -m tools.mynvr') DO @SET SERVERNAME=%%i

@IF %FULL_NAME% == MINIEYESNB1-怡哲 (
    @nvr --servername %SERVERNAME% %*
    @GOTO :END
)
@IF %FULL_NAME% == NVT02863_NB-NVT02863 (
    @nvr --servername %SERVERNAME% %*
    @GOTO :END
)
@IF %FULL_NAME% == MINIEYES-PC2-chenv (
    @nvr --servername %SERVERNAME% %*
    @GOTO :END
)
@ECHO No matching settings

:END
