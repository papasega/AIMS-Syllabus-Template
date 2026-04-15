#!/bin/bash
# Compilation script for Unix (macOS/Linux)
# This will automatically download the standalone LaTeX compiler (Tectonic) if it is missing

if [ ! -f ./tectonic ]; then
    echo "Downloading the lightweight Tectonic LaTeX engine..."
    curl --proto '=https' --tlsv1.2 -fsSL https://drop-sh.fullyjustified.net | sh
fi

echo "Compiling the syllabus..."
if [ -f aims_syllabus.tex ]; then
    ./tectonic aims_syllabus.tex
elif [ -f main.tex ]; then
    ./tectonic main.tex
else
    echo "Could not find a .tex file to compile!"
    exit 1
fi

echo "Success! The PDF has been generated."
