section .data
    msg db "Hello, World!", 10, 0  ; string + newline + null terminator

section .text
    global main
    extern printf

main:
    push msg
    call printf
    add esp, 4
    ret