:: echo off desactiva el echo de la consola para los comandos, la @ es un alias de echo off para el comando en donde se ejecuta.
@echo off

:: title Fija el título de la ventana
title Limpieza de la memoria de Windows

RAMMap64.exe   -Et0
RAMMap64.exe   -EW
RAMMap64.exe   -Es
RAMMap64.exe   -Em
RAMMap64.exe   -Et



