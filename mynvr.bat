@ECHO OFF
@FOR /F "delims=" %%a IN ('py -m tools.mynvr') DO (
    @SET server=%%a
)
@FOR %%a IN (%*) DO (
    @nvim --server %server% --remote "%%~fa"
)
