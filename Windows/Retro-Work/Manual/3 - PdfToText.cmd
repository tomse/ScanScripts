@echo off
REM v1.0 
REM tomse @ http://retro-commodore.eu
REM extracts text from an OCR'ed PDF file to a text file.
REM Updates metadata with metadata.txt info, which is lost 
REM After using ABBYY PDF Transformer
REM ------------------
REM Requires pdftotext (xpdf), and pdftoolkit (server version)


pdftotext manual_recognized.pdf manual2.ocr.txt
pdftk "manual_recognized.pdf" update_info D:\Retro-Work\metadata.txt output "manual2.pdf"