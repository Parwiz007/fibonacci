@echo off
setlocal enabledelayedexpansion

:: Get input parameter, default to 10 if not provided
set N=%1
if "%N%"=="" set N=10

set a=0
set b=1

echo The Fibonacci series is :

for /l %%i in (0,1,%N%-1) do (
    echo %%i    !a!
    set /a fn=a+b
    set /a a=b
    set /a b=fn
)

endlocal
