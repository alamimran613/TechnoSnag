@echo off
REM Delete all files in C:\tmp and subdirectories
del /q /f /s C:\tmp\*

REM Delete empty directories in C:\tmp
for /d %%i in (C:\tmp\*) do rmdir /s /q "%%i"

echo All files and empty directories in C:\tmp have been deleted.
