.model small
.stack 50h
.data
nl db 0dh, 0ah, '$'
.code
main proc
mov ax, @data
mov ds, ax
mov cx, 5
mov bx, 1
for_1:
push cx
mov dl, 20h
mov ah, 2
for_2:
int 21h
loop for_2
mov cx, bx
mov dl, '*'
mov ah, 2
for_3:
int 21h
loop for_3
lea dx, nl
mov ah, 9
int 21h
inc bx
pop cx
loop for_1
mov ah, 4ch
int 21h
main endp
end main