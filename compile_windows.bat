@echo off
:: Compilation script for Windows

echo WARNING: If you do not have LaTeX installed on your system,
echo we recommend installing Tectonic, a lightweight fast compiler.
echo.
echo If you have winget (Windows Package Manager), we will attempt to install it:
where tectonic >nul 2>nul
if %errorlevel% neq 0 (
    echo Tectonic not found. Attempting installation via winget...
    winget install tectonic
)

echo Compiling the syllabus...
if exist aims_syllabus.tex (
    tectonic aims_syllabus.tex
) else if exist main.tex (
    tectonic main.tex
) else (
    echo Could not find aims_syllabus.tex or main.tex!
    pause
    exit /b 1
)

echo Success! The PDF has been generated.
pause
