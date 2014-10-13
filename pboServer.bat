@echo off
SET PBOPATH=life_server.pbo
SET SOURCEDIR=extDB-Build\life_server\
IF EXIST %PBOPATH% (DEL %PBOPATH%)
tools\MakePbo\MakePbo.exe -L %SOURCEDIR% %PBOPATH%