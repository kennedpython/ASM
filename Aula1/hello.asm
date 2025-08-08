; Hello World — usando WriteConsoleA com GCC

section .data
    msg db "Hello World", 0x0A, 0
    tam equ $ - msg
    STD_OUTPUT_HANDLE equ -11
    NULL equ 0

section .text
    global main

    extern GetStdHandle
    extern WriteConsoleA
    extern ExitProcess

main:
    sub rsp, 32                     ; alinhamento da stack

    mov ecx, STD_OUTPUT_HANDLE
    call GetStdHandle                ; rax = handle

    mov rcx, rax                     ; handle
    mov rdx, msg                     ; ponteiro para string
    mov r8d, tam                     ; tamanho da string
    lea r9, [rsp+32]                 ; ponteiro para variável de retorno
    ;mov qword [rsp+40], NULL         ; lpReserved = NULL       Obs: isso não precisa ser passado o programa entende como Nulo porém coloquei para aprender.  
    call WriteConsoleA

    xor ecx, ecx                     ; código de saída
    call ExitProcess
