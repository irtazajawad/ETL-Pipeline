.model small
.stack 100h
.data
a db ?
b db ?
o db ?
msg1 db "Enter the first number: $"
msg2 db "Enter the second number: $"
msg3 db "Enter the operator: $"
result db "Result: $"

.code
main proc

mov ax, @data
mov ds, ax

;Taking the First Number
lea dx, msg1
mov ah, 09h
int 21h

mov ah, 01h
int 21h
sub al, 0
mov a, al

; Taking the Second Number
lea dx, msg2
mov ah, 09h
int 21h

mov ah, 01h
int 21h
sub al, '0'
mov b, al

;Taking the operator
lea dx, msg3
mov ah, 09h
int 21h

mov ah, 01h
int 21h
mov o, al

;Checking the operator
mov al, '+'
mov bl, o
je sum

;Adding the numbers
sum:
lea dx, result
mov ah, 09h
int 21h

mov dl, a
add dl, b

mov ah, 02h
int 21h
jmp end_of_program

jmp diff
;Subtracting the numbers if operator != +
diff:
lea dx, result
mov ah, 09h
int 21h

mov dl, a
sub dl, b

mov ah, 02h
int 21h

end_of_program:
mov ah, 4ch
int 21h

main endp
end main