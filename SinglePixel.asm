.model small
.stack 100h

.data

.code

main proc
    ; Set video mode to 13h (320x200, 256 colors)
    mov ah, 00h
    mov al, 13h
    int 10h

    ; Draw pixel at (600, 150) with color 0Fh (white)
    mov ah, 0Ch
    mov al, 04h
    mov cx, 600
    mov dx, 150
    int 10h

    ; End the program
    mov ah, 4ch
    int 21h
main endp
end main