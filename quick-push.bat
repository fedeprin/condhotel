@echo off
REM Quick push - versione veloce senza pause
REM Basta doppio click per fare commit e push!

setlocal enabledelayedexpansion

echo [CondHotel] Auto-pushing updates...

if not exist ".git" (
    echo ERRORE: Non sei nella cartella GitHub corretta!
    pause
    exit /b 1
)

git add -A
git commit -m "CondHotel Fanti updates"
git push origin main

if errorlevel 1 (
    echo ERRORE nel push!
    pause
    exit /b 1
) else (
    echo.
    echo ✓ DONE! Live in ~1-2 minutes
    echo https://fedeprin.github.io/condhotel/condhhotel-maps-optimization.html
    echo.
    timeout /t 3
)
