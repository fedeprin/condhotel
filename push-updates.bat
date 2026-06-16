@echo off
REM Script batch per fare commit e push automatico su GitHub
REM Creato per CondHotel Fanti - Ottimizzazione Google Maps

setlocal enabledelayedexpansion

echo.
echo ========================================
echo CondHotel Fanti - Auto Push to GitHub
echo ========================================
echo.

REM Verifica che siamo nella cartella corretta
if not exist ".git" (
    echo ERRORE: Questo script deve essere eseguito dalla cartella del repository GitHub!
    echo Assicurati di trovarti in: C:\Users\feder\Documents\GitHub\condhotel
    pause
    exit /b 1
)

echo [1/4] Checking git status...
git status
echo.

echo [2/4] Adding all changes...
git add -A
if errorlevel 1 (
    echo ERRORE: Fallito l'aggiunta dei file
    pause
    exit /b 1
)
echo ✓ File aggiunti con successo
echo.

echo [3/4] Creating commit...
set "timestamp=%date% %time%"
git commit -m "Update: CondHotel Fanti optimization - Logo SVG and meeting notes section added"
if errorlevel 1 (
    echo ERRORE: Fallito il commit (potrebbero non esserci cambiamenti)
    pause
    exit /b 1
)
echo ✓ Commit creato con successo
echo.

echo [4/4] Pushing to GitHub...
git push origin main
if errorlevel 1 (
    echo ERRORE: Fallito il push. Verifica la tua connessione e credenziali GitHub
    pause
    exit /b 1
)
echo ✓ Push completato con successo!
echo.

echo ========================================
echo ✓ DEPLOY COMPLETATO!
echo ========================================
echo.
echo Il file è stato pubblicato su GitHub Pages.
echo Verifica in ~1-2 minuti su:
echo https://fedeprin.github.io/condhotel/condhhotel-maps-optimization.html
echo.
pause
