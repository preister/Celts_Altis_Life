@echo off
SET PBOPATH=..\Altis_Life.Altis.pbo
SET SOURCEDIR=Altis_Life.Altis
IF EXIST %PBOPATH% (DEL %PBOPATH%)
PUSHD extDB-Build
..\tools\MakePbo\MakePbo.exe -L %SOURCEDIR% %PBOPATH%
POPD