@echo off
rem Downloads the official PDFMathTranslate Windows build (v1.9.11) from GitHub
rem and unpacks it next to this script, then applies the Vietnamese layout patch (patch\converter.py).
chcp 65001 >nul
setlocal
set "HERE=%~dp0"
set "VER=v1.9.11"
set "URL=https://github.com/PDFMathTranslate/PDFMathTranslate/releases/download/%VER%/pdf2zh-%VER%-with-assets-win64.zip"
set "ZIP=%HERE%pdf2zh.zip"

if exist "%HERE%pdf2zh\build\pdf2zh.exe" (
  echo Da cai roi. Keo file PDF tha vao "dich-pdf.bat" de dich.
  pause
  exit /b 0
)

rem Use the Windows built-in curl/tar: Git for Windows puts GNU tar on PATH, which reads "C:" as a remote host.
set "CURL=%SystemRoot%\System32\curl.exe"
set "TAR=%SystemRoot%\System32\tar.exe"

if exist "%ZIP%" goto unpack
echo [1/2] Dang tai PDFMathTranslate %VER% (~550 MB) tu GitHub...
"%CURL%" -L --fail -o "%ZIP%.part" "%URL%"
if errorlevel 1 (
  echo Tai that bai. Kiem tra mang roi chay lai.
  pause
  exit /b 1
)
move /y "%ZIP%.part" "%ZIP%" >nul

:unpack

echo [2/2] Dang giai nen...
rem tar exits non-zero on the one entry with a Chinese file name (VC++ installer); judge by the files we need.
"%TAR%" -xf "%ZIP%" -C "%HERE%." 2>nul
if not exist "%HERE%pdf2zh\build\site-packages\pdf2zh\converter.py" (
  echo Giai nen that bai.
  pause
  exit /b 1
)
del "%ZIP%"

rem Vietnamese layout fixes (wrap at spaces, shrink single-line overflow, line height); see patch\converter.diff
copy /y "%HERE%patch\converter.py" "%HERE%pdf2zh\build\site-packages\pdf2zh\converter.py" >nul
if exist "%HERE%pdf2zh\build\site-packages\pdf2zh\__pycache__" rmdir /s /q "%HERE%pdf2zh\build\site-packages\pdf2zh\__pycache__"

echo.
echo Xong. Keo file PDF tha vao "dich-pdf.bat" de dich sang tieng Viet.
echo Neu bao thieu VC++ (loi MSVCP140/VCRUNTIME140): tai va cai https://aka.ms/vs/17/release/vc_redist.x64.exe
pause
