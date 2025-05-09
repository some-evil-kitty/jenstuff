:: literally just from deepseek lol

@echo off
setlocal enabledelayedexpansion

:: Define the program (adjust as needed)
set "PROGRAM=program"

:: Define directories to exclude (separate with spaces)
set "EXCEPTIONS=dir1 dir2 dir3"

:: Loop through all directories
for /d %%d in (*) do (
    set "skip="
    :: Check if directory is in exceptions
    for %%e in (%EXCEPTIONS%) do (
        if "%%d"=="%%e" set "skip=1"
    )
    :: If not skipped, run the program with the directory as an argument
    if not defined skip (
        echo Running "%PROGRAM%" on "%%d"
        call "%PROGRAM%" "%%d"
    )
)

echo Done.
pause
