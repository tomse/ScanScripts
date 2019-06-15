@echo off
mkdir work
cd origs
for %%i in (*.tif) DO (
convert "%%i" -level 11%%,86%% "..\work\%%i"
)
for %%i in (*.png) DO (
convert "%%i" -level 11%%,86%% "..\work\%%i"
)