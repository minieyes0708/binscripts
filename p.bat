FOR /F "tokens=* USEBACKQ" %%F IN (`type %USERPROFILE%\.bashrc.d\user\programs.txt ^| fzy`) DO (
    %%F %*
)
