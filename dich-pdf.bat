@echo off
rem Drag one or more PDF files onto this script. Each file is translated
rem English -> Vietnamese with the free Bing service (Google free endpoint returns 429 from many IPs), 2 threads; output lands next to the source:
rem   <name>-mono.pdf (Vietnamese only) and <name>-dual.pdf (bilingual).
chcp 65001 >nul
setlocal
set "EXE=%~dp0pdf2zh\build\pdf2zh.exe"

if not exist "%EXE%" (
  echo Chua cai. Chay "cai-dat.bat" truoc.
  pause
  exit /b 1
)
if "%~1"=="" (
  echo Keo file PDF tha vao file nay de dich.
  pause
  exit /b 1
)

:next
if "%~1"=="" goto done
echo.
echo === Dang dich: %~nx1
"%EXE%" "%~f1" -li en -lo vi -s bing -t 2 -o "%~dp1."
shift
goto next

:done
echo.
echo Xong. File dich nam canh file goc: ...-mono.pdf (tieng Viet), ...-dual.pdf (song ngu).
pause
