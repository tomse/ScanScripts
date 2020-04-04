mkdir pages
for %%i in (*.tif) DO (
convert %%i -grayscale rec709luma pages\%%i
)

for %%i in (*.png) DO (
convert %%i -grayscale rec709luma pages\%%i
)