@echo off
echo Building OIR Docker image...
cd /d "%~dp0"
docker build -t oir-torch7 .
echo.
echo Done!
pause