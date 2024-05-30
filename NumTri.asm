.model small
.stack 100h
.data
.code
main proc

mov ax, @data
mov ds, ax
mov cx, 5 ; Number of rows in the triangle
mov bx, 1 ; Counter for the first number in the first row
print_triangle:
mov si, 1
mov di, bx
print_numbers:
cmp si, di
jg next_row
mov ax, di
add ax, '0'
mov dl, al
mov ah, 02h
int 21h
inc si
jmp print_numbers
next_row:
mov dl, 0Ah
int 21h
inc bx
mov si, 1
; Decrement the number of rows left to print
loop print_triangle
mov ah, 4ch
int 21h
main endp
end main