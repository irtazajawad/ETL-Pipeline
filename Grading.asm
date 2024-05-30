.model small
.stack 100h
.data
message db 'Enter obtained marks (0-10): $'
grade_msg db 'Grade: $'
grade_A db 'A$'
grade_B db 'B$'
grade_C db 'C$'
grade_D db 'D$'
grade_F db 'F$'
fail_msg db 'Fail$'
obtained_marks db ?
.code
main proc
mov ax, @data
mov ds, ax
mov ah, 09h
lea dx, message
int 21h
mov ah, 01h
int 21h
sub al, '0'
mov obtained_marks, al

cmp al, 8
je grade_A_label
cmp al, 7
je grade_B_label
cmp al, 6
je grade_C_label
cmp al, 5
je grade_D_label
cmp al, 4
je grade_F_label

mov ah, 09h
lea dx, fail_msg
int 21h
jmp end_program_label
grade_A_label:
mov ah, 09h
lea dx, grade_msg
int 21h
mov dx, offset grade_A
int 21h
jmp end_program_label
grade_B_label:
mov ah, 09h
lea dx, grade_msg
int 21h
mov dx, offset grade_B
int 21h
jmp end_program_label
grade_C_label:
mov ah, 09h
lea dx, grade_msg
int 21h
mov dx, offset grade_C
int 21h
jmp end_program_label
grade_D_label:
mov ah, 09h

lea dx, grade_msg
int 21h
mov dx, offset grade_D
int 21h
jmp end_program_label
grade_F_label:
mov ah, 09h
lea dx, grade_msg
int 21h
mov dx, offset grade_F
int 21h
jmp end_program_label
end_program_label:
mov ah, 4ch ; Exit program
int 21h
main endp
end main