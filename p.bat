FOR /F "tokens=* USEBACKQ" %%F IN (`type %USERPROFILE%\.bashrc.d\user\programs.txt ^| fzf`) DO (
    %%F %*
)
