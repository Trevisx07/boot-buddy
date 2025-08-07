[org 0x7C00]
bits 16
start:
    cli
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00
    mov si, hello_msg
    call print_string
hang:
    jmp hang
print_string:
.loop:
    lodsb
    test al, al
    jz .done
    mov ah, 0x0E
    int 0x10
    jmp .loop
.done:
    ret
hello_msg db `Hello from Kernel!\r\n\0`
times 510-($-$$) db 0
dw 0xAA55