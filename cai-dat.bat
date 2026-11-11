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

echo [1/2] Dang tai PDFMathTranslate %VER% (~550 MB) tu GitHub...
curl -L --fail -o "%ZIP%" "%URL%"
if errorlevel 1 (
  echo Tai that bai. Kiem tra mang roi chay lai.
  pause
  exit /b 1
)

echo [2/2] Dang giai nen...
tar -xf "%ZIP%" -C "%HERE%"
if errorlevel 1 (
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
echo Neu bao thieu VC++ thi chay file trong thu muc pdf2zh\build co ten bat dau bang "无法运行".
pause
