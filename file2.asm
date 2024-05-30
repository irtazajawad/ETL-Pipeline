.model small
.stack 100h

.data
    success_message db "File opened successfully!", 0Dh, 0Ah, "$"
    error_message db "Error: Unable to open file!", 0Dh, 0Ah, "$"
    fname db "FILENAME.txt", 0
    fhandle dw ?

.code
main:
    ; Set up segment registers
    mov ax, @data
    mov ds, ax
    mov es, ax

    ; Set AH to 3Dh (function to open a file)
    mov ah, 3Dh
    ; Set AL to 0 (open existing file for reading)
    mov al, 0
    ; Load the offset of the file name into DX
    lea dx, fname
    ; Call interrupt 21h (DOS interrupt) to open the file
    int 21h
    ; Check the carry flag to see if there was an error
    jc if_error
    ; If no error, move the file handle to a variable
    mov [fhandle], ax

    ; Print a success message
    mov ah, 9
    lea dx, success_message
    int 21h

    ; Exit the program
    mov ah, 4Ch
    int 21h

if_error:
    ; Print an error message
    mov ah, 9
    lea dx, error_message
    int 21h

    ; Exit the program
    mov ah, 4Ch
    int 21h



end main
