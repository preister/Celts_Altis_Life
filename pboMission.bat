@echo off
SET PBOPATH=Altis_Life.Altis.pbo
SET SOURCEDIR=extDB-Build\Altis_Life.Altis\
IF EXIST %PBOPATH% (DEL %PBOPATH%)
tools\MakePbo\MakePbo.exe -L %SOURCEDIR% %PBOPATH%