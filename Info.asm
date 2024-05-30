.model small
.stack 100h
.data

.code
main:                       
mov  ax, @data
mov  ds, ax
mov  ax, 0013h                      ; Set video mode to 320x200 256-color mode (mode 13h)z
int  10h


; ------------------------------- INFO-I -----------------------------

mov  al, 0Bh  ; Set square color
mov  cx, 120  ; Top-left corner x-coordinate
mov  dx, 15   ; Top-left corner y-coordinate
draw_square_infoI:             
mov  si, 12 ; Load size of the square
draw_horizontal_line_infoI:    
push si                             ; Preserve si value
mov  si, 2  ; Reload size of the square
draw_vertical_line_infoI:      
; Plot pixel at current position
mov  ah, 0Ch
int  10h

; Move to the next pixel (x++)
inc  cx
; Decrement size counter
dec  si
jnz  draw_vertical_line_infoI          ; Repeat until the line is drawn
; Restore si value
pop  si
; Move to the next line (y++)
inc  dx
; Move back to the beginning of the line
mov  cx, 120  ;Top-left x-coordinate
; Decrement size counter
dec  si
jnz  draw_horizontal_line_infoI        ; Repeat until the square is drawn


; Wait for any key press before exiting
mov  ah, 0
int  16h
; Return to text mode (mode 3)
mov  ax, 0003h
int  10h
; Exit program
mov  ax, 4C00h
int  21h
end main