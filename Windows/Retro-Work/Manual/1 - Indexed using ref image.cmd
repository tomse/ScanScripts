@echo off
REM v1.0 
REM tomse @ http://retro-commodore.eu
REM create a 3col.png 1x3 pix with each it's own color
REM in the root of the manuals work dir (together with this script)

cd work/out
mkdir indexed
for %%i in (*.tif) DO (
convert %%i +dither -remap ..\..\3col.png indexed\%%~ni.png
)