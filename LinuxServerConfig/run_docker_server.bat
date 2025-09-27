@echo off
call "%~dp0\..\DevopsData\config.bat"


docker run -p 7778:7777/udp --rm -it game-server:%VERSION%