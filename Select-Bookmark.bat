@ECHO OFF
SET target_path=
@FOR /F "tokens=* USEBACKQ" %%i IN (`type %USERPROFILE%\.config\bookmarks.txt ^| fzf`) DO set target_path=%%i

IF "%COMPUTERNAME%-%USERNAME%" == "NVT02863_NB-NVT02863" (
    IF "%target_path%" == "D:/minieyes_chen/program" (
        SET target_path=
        @FOR /F "tokens=* USEBACKQ" %%i IN (`fd -a -i -d 1 -t d . D:/minieyes_chen/program ^| fzf`) DO set target_path=%%i
    )
)

IF "%target_path%" == "" (
    @ECHO|SET /p="%CD:\=/%"
) ELSE (
    @ECHO|SET /p="%target_path:\=/%"
)
