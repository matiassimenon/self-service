@echo off

rem determine whether we use a 64-bit java version

set java_version_file=%time::=%
set /a java_version_file=java_version_file
set java_version_file=__JVER%java_version_file%%random%.tmp
"%JAVA%" -version 2> %java_version_file%
for /f %%G IN ('findstr "64-Bit" %java_version_file%') DO set sixtyfour=true
rem Check minor java version number in string like 'java version "1.7.0_80"'
for /f "tokens=3" %%g in ('findstr /i /c:"java version" %java_version_file%') do (
    set JAVAVER=%%g
)
set JAVAVER=%JAVAVER:"=%
set JAVAVER_MINOR=7
for /f "delims=. tokens=2" %%v in ("%JAVAVER%") do (
    set JAVAVER_MINOR=%%v
)
del %java_version_file%

rem Check/Set up some easily accessible MIN/MAX params for JVM mem usage

if "%JAVA_MIN_MEM%" == "" (
    if "%sixtyfour%" == "" (
        set JAVA_MIN_MEM=128M 
    ) else (
        set JAVA_MIN_MEM=256M
    )
)

if "%JAVA_MAX_MEM%" == "" (
    if "%sixtyfour%" == "" (
        set JAVA_MAX_MEM=512M 
    ) else ( 
        set JAVA_MAX_MEM=1024M
    )
)

if %JAVAVER_MINOR% LSS 8 (
    if "%JAVA_PERM_MEM%" == "" (
        if "%sixtyfour%" == "" (
            set JAVA_PERM_MEM=64M 
        ) else (
            set JAVA_PERM_MEM=128M
        )
    )
    
    if "%JAVA_MAX_PERM_MEM%" == "" (
        if "%sixtyfour%" == "" (
            set JAVA_MAX_PERM_MEM=128M 
        ) else (
            set JAVA_MAX_PERM_MEM=256M
        )
    )
)

