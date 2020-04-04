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

if NOT EXIST tablet mkdir tablet


for %%i in (*.tif) DO (
if !thumb!==1 (
convert %%i -resize 240x310^^! -quality 75%% "!folder!\thumb.jpg"
)
set thumb=2
convert -units pixelsperinch %%i -resample 150 tablet\%%~ni.jpg
)

rem 300dpi mag

for %%i in (*.tif) DO (
convert %%i output\%%~ni.pdf
)
cd output
del *.jpg /q
pdftk *.pdf D:\Retro-Work\brought_to_you_by.pdf cat output "!folder!\_mag.pdf"
pdftk "!folder!\_mag.pdf" update_info D:\Retro-Work\metadata.txt output "!folder!\mag.pdf"
del *.pdf /q
del "!folder!\_mag.pdf"
cd ..


rem Tablet
cd tablet
for %%i in (*.jpg) DO (
convert %%i %%~ni.pdf
)
del *.jpg /q
pdftk *.pdf D:\Retro-Work\brought_to_you_by_[TABLET].pdf cat output _tablet.pdf
pdftk _tablet.pdf update_info D:\Retro-Work\metadata.txt output "!folder!\_tablet.pdf"
del *.pdf /q
pause
