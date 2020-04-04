@echo off

setlocal EnableDelayedExpansion
set folder=%cd%
cd work\out

choice /m "Fix paging "
if %errorlevel%==1 (
copy D:\Retro-Work\correct_pages.php .\ /y
php -f correct_pages.php
cd newpages
)

choice /C LSN /m "Use large (L), small (S) or no (N) lastpage  "
if %errorlevel%==1 (
set page=brought_to_you_by.pdf
) else if %errorlevel%==2 (
set page=brought_to_you_by_[TABLET].pdf
)

if NOT EXIST output mkdir output
set thumb=1

for %%i in (*.tif) DO (
if !thumb!==1 (
convert %%i -resize 240x310^^! -quality 80%% "!folder!\thumb.jpg"
)
set thumb=2
convert %%i output\%%~ni.pdf
)


cd output
REM for %%i in (*.jpg) DO (
REM convert %%i %%~ni.pdf
REM )

REM del *.jpg /q
pdftk *.pdf "D:\Retro-Work\%page%" cat output "%folder%\_manual.pdf"
pdftk "%folder%\_manual.pdf" update_info D:\Retro-Work\metadata.txt output "%folder%\manual.pdf"
del *.pdf /q
REM del ..\*.* /q
del "%folder%\_manual.pdf" /q

pause
