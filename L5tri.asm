.model small
.stack 100h
.data
.code
main proc
mov ax, @data
mov ds, ax
mov cx, 5
mov bx, 1
print_triangle:
mov si, bx
print_asterisks:
mov dl, '*'
mov ah, 02h
int 21h
dec si
jnz print_asterisks
mov dl, 0Ah
int 21h
inc bx
loop print_triangle
mov ah, 4ch
int 21h

main endp
end main