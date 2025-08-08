@echo off
chcp 65001 >nul
setlocal

nasm -f win64 hello.asm -o hello.obj
if errorlevel 1 (
    echo [ERRO] Falha na compilação com NASM.
    goto end
)

gcc hello.obj -o hello.exe
if errorlevel 1 (
    echo [ERRO] Falha ao linkar com GCC.
    goto end
)
echo.

hello.exe

echo.

:end
endlocal