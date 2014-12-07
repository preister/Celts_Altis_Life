@echo off
SET PBOPATH=..\life_server.pbo
SET SOURCEDIR=life_server
IF EXIST %PBOPATH% (DEL %PBOPATH%)
PUSHD extDB-Build
..\tools\MakePbo\MakePbo.exe -L %SOURCEDIR% %PBOPATH%
POPD