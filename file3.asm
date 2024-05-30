.model small
.stack 100h

.data
    filename db "FILENAME.txt", 0
    buffer db "Sample text", 0
    success_message db "Text written to file successfully!", 0Dh, 0Ah, "$"
    error_message db "Error: Unable to write text to file!", 0Dh, 0Ah, "$"

    fhandle dw ?

.code
main:
    ; Set up segment registers
    mov ax, @data
    mov ds, ax
    mov es, ax

    ; Set AH to 3Dh (function to open a file)
    mov ah, 3Dh
    ; Set AL to 02h (open existing file for writing)
    mov al, 02h
    ; Load the offset of the file name into DX
    lea dx, filename
    ; Call interrupt 21h (DOS interrupt) to open the file
    int 21h
    ; Check the carry flag to see if there was an error
    jc if_error
    ; If no error, move the file handle to a variable
    mov [fhandle], ax

    ; Write text to the file
    ; Set AH to 40h (function to write to a file)
    mov ah, 40h
    ; Load the file handle into BX
    mov bx, [fhandle]
    ; Load the offset of the buffer into DX
    lea dx, buffer
    ; Get the length of the text
    mov cx, 11 ; Adjust the number according to the length of the text
    ; Call interrupt 21h to write to the file
    int 21h
    ; Check the carry flag to see if there was an error
    jc if_error

    ; Print a success message
    mov ah, 9
    lea dx, success_message
    int 21h

    ; Close the file
    ; Set AH to 3Eh (function to close a file)
    mov ah, 3Eh
    ; Load the file handle into BX
    mov bx, [fhandle]
    ; Call interrupt 21h to close the file
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
