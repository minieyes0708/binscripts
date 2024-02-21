FOR /F "tokens=* USEBACKQ" %%F IN (`type %ProgramLists% ^| fzf`) DO (
    %%F %*
)
