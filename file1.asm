.model small
.stack 100h

.data
    fname db "file12.txt", 0
    fhandle dw ?

.code
main:
    ; Set up segment registers
    mov ax, @data
    mov ds, ax
    mov es, ax

    ; Set AH to 3Ch (function to create a file )
    mov ah, 3Ch
    ; Load the offset of the file name into DX
    lea dx, fname
    ; Set CL to 0 (unused parameter)
    mov cl, 0
    ; Call interrupt 21h (DOS interrupt) to open or create the file
    int 21h
    ; Check the carry flag to see if there was an error
    jc if_error
    ; If no error, move the file handle to a variable
    mov [fhandle], ax

    ; Exit the program
    mov ah, 4Ch
    int 21h

if_error:
    ; Handle error here, e.g., display error message
    ; and exit the program
    mov ah, 4Ch
    int 21h

end main
