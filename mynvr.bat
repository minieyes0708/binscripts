@SET FULL_NAME=%COMPUTERNAME%-%USERNAME%

@IF %FULL_NAME% == MINIEYESNB1-怡哲 DO @(
    @py -m tools.mynvr "%*"
    @GOTO :END
)
@IF %FULL_NAME% == NVT02863_NB-NVT02863 DO @(
    @py -m tools.mynvr "%*"
    @GOTO :END
)
@IF %FULL_NAME% == MINIEYES-PC2-chenv DO @(
    @py -m tools.mynvr "%*"
    @GOTO :END
)
@ECHO No matching settings

:END
