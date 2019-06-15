@echo off

REM v1.0 
REM tomse @ http://retro-commodore.eu
REM Creates hash values into text files for validation
REM Requires md5sum and sha1sum cli tools.
REM You probably don't need this


for %%i in (*.pdf) DO (

md5sum  "%%i" > "%%i.md5"
sha1sum "%%i" > "%%i.sha1"
)
for %%i in (*.ocr.txt) DO (
md5sum  "%%i" > %%i.md5
sha1sum "%%i" > %%i.sha1
)

for %%i in (*[ocr].txt) DO (
md5sum  "%%i" > %%i.md5
sha1sum "%%i" > %%i.sha1
)

for %%i in (*.zip) DO (
md5sum  "%%i" > %%i.md5
sha1sum "%%i" > %%i.sha1
)
