.model small
.stack 100h

.data
    filename db "FILENAME.txt", 0
    buffer db 100 dup(?) ; Assuming a buffer size of 100 bytes
    error_message db "Error: Unable to read text from file!", 0Dh, 0Ah, "$"
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
    lea dx, filename
    ; Call interrupt 21h (DOS interrupt) to open the file
    int 21h
    ; Check the carry flag to see if there was an error
    jc if_error
    ; If no error, move the file handle to a variable
    mov [fhandle], ax

    ; Read text from the file
    ; Set AH to 3Fh (function to read from a file)
    mov ah, 3Fh
    ; Load the file handle into BX
    mov bx, [fhandle]
    ; Load the offset of the buffer into DX
    lea dx, buffer
    ; Load CX with the size of the buffer
    mov cx, 100 ; Adjust the buffer size as needed
    ; Call interrupt 21h to read from the file
    int 21h
    ; Check the carry flag to see if there was an error
    jc if_error

    ; Print the read text
    mov ah, 9
    lea dx, buffer
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



