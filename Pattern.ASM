.model small
.386
.stack 100h
.data
SPAC DB 13,10,'$'

MESSAGE1 DB 09, '     ==================================================== $'
MESSAGE2 DB 09, '     ==================================================== $'
MESSAGE3 DB 09, '                Welcome to APU MOONLIGHT EVENT! $'
MESSAGE4 DB 09, '         The Event is organized by APU Management Unit $'
MESSAGE5 DB 09, '               This event is all about MOONLIGHT! $'
MESSAGE6 DB 09, '                    Date: 7/6/2022 - 8/6/2022 $'
MESSAGE7 DB 09, '                       Time: 5PM - 10PM $'
MESSAGE8 DB 09, '     ==================================================== $'
MESSAGE9 DB 09, '     ==================================================== $'


MAINMENU db 09, ' MAIN MENU:$'
MAINMENU1 db 10, 9, " 1) Number Patterns $"
MAINMENU2 db 10, 9, " 2) Design Patterns $"
MAINMENU3 db 10, 9, " 3) Box Type Patterns$"
MAINMENU4 db 10, 9, " 4) Nested Loop Patterns $"
MAINMENU5 db 10, 9, " 5) Exit $"
CHOICE db 13,10, "Your Selection:$",13,10
error db, "Invalid Selection or Input. Please Try again! $"
star db ?
blank db ?

.CODE
;MACRO
MessagedShow Macro Mess
lea dx, Mess 
mov ah, 9h
int 21h
EndM

MAIN PROC
mov ah, 6 
mov al, 0 
mov bh, 60 
mov cx, 0 
mov dl, 10 
mov dh, 10 

int 10h
mov ax, @data 
mov ds, ax 
mov ah, 13h 
mov al, 0 
mov bh, 0 
mov bl, 2 
mov cx, 6 
mov dh, 3 
mov dl, 36 
mov bp, offset MESSAGE1 

int 10h
mov ah, 13h
mov al, 0
mov bh, 0
mov bl, 1
mov cx, 8
mov dh, 4
mov dl, 35
mov bp, offset MESSAGE1

int 10h
mov ah, 13h
mov al, 0
mov bh, 0
mov bl, 14
mov cx, 2
mov dh, 5
mov dl, 35
mov bp, offset MESSAGE1

int 10h
mov ah, 13h
mov al, 0
mov bh, 0
mov bl, 14
mov cx, 2
mov dh, 5
mov dl, 41
mov bp, offset MESSAGE1

int 10h
mov ah, 13h
mov al, 0
mov bh, 0
mov bl, 14
mov cx, 2
mov dh, 6
mov dl, 35
mov bp, offset MESSAGE1

int 10h
mov ah, 13h
mov al, 0
mov bh, 0
mov bl, 14
mov cx, 2
mov dh, 6
mov dl, 41
mov bp, offset MESSAGE1

int 10h
mov ah, 13h
mov al, 0
mov bh, 0
mov bl, 14
mov cx, 2
mov dh, 7
mov dl, 35
mov bp, offset MESSAGE1

int 10h
mov ah, 13h
mov al, 0
mov bh, 0
mov bl, 14
mov cx, 2
mov dh, 7
mov dl, 41
mov bp, offset MESSAGE1

int 10h
mov ah, 13h
mov al, 0
mov bh, 0
mov bl, 14
mov cx, 2
mov dh, 8
mov dl, 35
mov bp, offset MESSAGE1

int 10h
mov ah, 13h
mov al, 0
mov bh, 0
mov bl, 14
mov cx, 2
mov dh, 8
mov dl, 41
mov bp, offset MESSAGE1

int 10h
mov ah, 13h
mov al, 0
mov bh, 0
mov bl, 14
mov cx, 8
mov dh, 9
mov dl, 35
mov bp, offset MESSAGE1

int 10h
mov ah, 13h
mov al, 0
mov bh, 0
mov bl, 14
mov cx, 6
mov dh, 10
mov dl, 36
mov bp, offset MESSAGE1

int 10h
 mov ah, 09h
 mov bh, 0
 mov bl, 140
 mov cx, 100
 int 10h
MessagedShow MESSAGE1
MessagedShow SPAC

 mov ah, 09h
 mov bh, 0
 mov bl, 140
 mov cx, 100
 int 10h
MessagedShow MESSAGE2
MessagedShow SPAC

 mov ah, 09h
 mov bh, 0
 mov bl, 11
 mov cx, 100
 int 10h
MessagedShow MESSAGE3
MessagedShow SPAC

 mov ah, 09h
 mov bh, 0
 mov bl, 13
 mov cx, 100
 int 10h
MessagedShow MESSAGE4
MessagedShow SPAC

 mov ah, 09h
 mov bh, 0
 mov bl, 12
 mov cx, 100
 int 10h
MessagedShow MESSAGE5
MessagedShow SPAC

 mov ah, 09h
 mov bh, 0
 mov bl, 14
 mov cx, 100
 int 10h
MessagedShow MESSAGE6
MessagedShow SPAC


 mov ah, 09h
 mov bh, 0
 mov bl, 10
 mov cx, 100
 int 10h
MessagedShow MESSAGE7
MessagedShow SPAC

 mov ah, 09h
 mov bh, 0
 mov bl, 140
 mov cx, 100
 int 10h
MessagedShow MESSAGE8
MessagedShow SPAC

 mov ah, 09h
 mov bh, 0
 mov bl, 140
 mov cx, 100
 int 10h
MessagedShow MESSAGE9
MessagedShow SPAC

MessagedShow MAINMENU
MessagedShow MAINMENU1
MessagedShow MAINMENU2
MessagedShow MAINMENU3
MessagedShow MAINMENU4
MessagedShow MAINMENU5

MENU:
mov ah, 9
MessagedShow CHOICE
mov ah, 1
int 21h
cmp al, 49
jne DESIGN
MessagedShow SPAC
call NUMBER 
jmp begin

DESIGN:
cmp al, 50
jne BOX
call DESIGN1 
jmp begin

BOX:
cmp al, 51
jne NESTED
call BOX1 
jmp begin

NESTED:
cmp al, 52
jne DEAD
call NEST 
jmp begin
DEAD: ; END THE PROGRAM
cmp al, 53
jne error_1
jmp ENDING
error_1: ; SHOW ERROR MESSAGE IF WRONG INPUT
mov al, 9
mov dx, offset error
int 21h
MessagedShow error
begin: ; LOOP MENU
loop menu
ENDING:
mov cx, 5
top:
mov dl, 10
mov ah, 2
int 21h
loop top
mov ah, 4ch
int 21h

RIGHT2:
    MOV DL,09
    INT 21H
    JMP TOPRIGHT 

RESET:
    CMP CL,BH
    JE RIGHT3
    JMP TOPBOTTOM

RIGHT3:
    MOV DL,09
    INT 21H
    DEC DH
    DEC CH
    DEC CL
    JMP TOPBOTTOM    

main endp

;NUMBER PATTERN (LOOP)
NUMBERS Macro rows;
mov bh,00h

STARTNUMBERS:
mov dl,bh
add dl,30h

mov ah,2
int 21h

inc bh
cmp bh,rows 
jbe STARTNUMBERS

dec bh 
cmp rows,0
je ENDNUMBERS

TURNNUMBERS:
dec bh
mov dl,bh
add dl,30h

mov ah,2
int 21h

cmp bh,0
ja TURNNUMBERS

ENDNUMBERS:
EndM 

NUMBERS2 Macro rows;
mov bh,00h

STARTNUMBERS2:
mov dl,bh
add dl,30h

mov ah,2
int 21h

inc bh
cmp bh,rows 
jbe STARTNUMBERS2

dec bh 
cmp rows,0
je ENDNUMBERS2

TURNNUMBERS2:
dec bh
mov dl,bh
add dl,30h

mov ah,2
int 21h

cmp bh,0
ja TURNNUMBERS2

ENDNUMBERS2:
EndM 

NUMBER proc
mov ah,2
mov cl,0 ; ROWS
mov bl,9;

GSPACES:
mov ch,bl;
sub ch,cl;

PSPACE:
mov dl,32;
int 21h
 
dec ch

cmp ch,0
jne PSPACE

NUMBERS cl

mov dl,10 ; NEXT LINE
int 21h

inc cl
cmp cl,bl
jne GSPACES

;SECOND-HALF

dec cl 
dec cl 

GSPACES2:
mov ch,cl;
sub ch,bl;

PSPACE2:
mov dl,32;
int 21h
 
inc ch

cmp ch,0
jne PSPACE2

NUMBERS2 cl

mov dl,10 
int 21h

dec cl
cmp cl,-1
jne GSPACES2
ret
 NUMBER endp

;DESIGN PATTERN (LOOP)

CTR1 DW 0
CTR2 DW 0
CTR4 DW 7
CTR3 DW 3
CTR5 DW 0
CTR6 DW 1

DESIGN1 proc

MOV AH,9
   MessagedShow SPAC
    INT 21H

   STARTER:
            INC CTR1
            CMP CTR1, 2
            JL RESTART
            MOV CX, CTR2
            
        LOOPDESIGN:
            CMP CTR2,0
            JE JUMPLOOP
            MOV DL,32
            MOV AH,2
            INT 21H
            LOOP LOOPDESIGN

        JUMPLOOP:
            INC CTR2
            CMP CTR1,5
            JE RESTART
            MOV DL, 35
            MOV AH, 2
            INT 21H

        RESTART:
            MOV CX, CTR3

        STARTDESIGN:

            MOV BX, CX
            MOV CX, CTR4
            CMP CTR1, 5
            JE D2

        D1:
            MOV DL, 32
            MOV AH, 02
            INT 21H
            LOOP D1

        D2:
            MOV DL, 35
            MOV AH, 02
            INT 21H
            MOV CX, CTR5

        D3:
            CMP CTR5, 0
            JE D4
            MOV DL, 32
            MOV AH, 02
            INT 21H
            LOOP D3

        D4:
            CMP CTR1, 5
            JE JUMPSPACE
            MOV DL, 35
            MOV AH, 02
            INT 21H

        JUMPSPACE:
            MOV CX, BX
            LOOP STARTDESIGN
            CMP CTR1, 5
            JNE SC
            MOV DL, 35
            MOV AH, 02
            INT 21H

        SC:
            MOV DL, 10
            MOV DH, 02
            INT 21H
            MOV DL,13
            INT 21H
            CMP CTR6, 5
            JE FIN

            INC CTR5
            INC CTR5
            DEC CTR4
            DEC CTR4
            INC CTR6
            CMP CTR6,6
            JNE STARTER

        FIN:
            DEC CTR2
            DEC CTR2
            INC CTR4
            INC CTR4
            DEC CTR5
            DEC CTR5

        STARTCR1:
            DEC CTR1
            CMP CTR1,2
            JL LOOPDESIGN3
            MOV CX, CTR2

        LOOPDESIGN1:
            CMP CTR2,0
            JE LOOPDESIGN2
            MOV DL, 32
            MOV AH, 02
            INT 21H
            LOOP LOOPDESIGN1

        LOOPDESIGN2:
            DEC CTR2
            MOV DL,35
            MOV AH, 02
            INT 21H

        LOOPDESIGN3:
            MOV CX, CTR3

        DESIGNEND:
            MOV BX, CX
            MOV CX, CTR4

        D5:
            MOV DL, 32
            MOV AH, 02
            INT 21H
            LOOP D5

        D6:
            MOV DL, 35
            MOV AH, 02
            INT 21H
            MOV CX, CTR5

        D7:
            CMP CTR5,0
            JE D8
            MOV DL, 32
            MOV AH, 02
            INT 21H
            LOOP D7

        D8:
            MOV DL, 35
            MOV AH, 02
            INT 21H
            MOV CX, BX
            LOOP DESIGNEND

        LASTDESIGNEND:
            MOV DL,10
            MOV AH,02
            INT 21H
            MOV DL,13
            INT 21H
            DEC CTR5
            DEC CTR5
            INC CTR4
            INC CTR4
            DEC CTR6
            CMP CTR6,1
            JNE STARTCR1
            MOV CTR2,0
            MOV CTR4,7
            MOV CTR3,3
            MOV CTR5,0
            MOV CTR6,1
            MOV CTR1,0
ret
DESIGN1 endp

;BOX PATTERN (LOOP)
BOX1 proc
mov dl, 10
int 21h
mov ah, 2 
mov bl, 5 
mov cl, 0 
mov ch, 8 

;FIRST LINE
TOPF:
inc cl 
mov dl, 'U' 
int 21h 
mov dl, " " ;
int 21h
cmp cl, ch
jne TOPF 
mov ah, 2
mov dl, 00h 
int 21h
mov dl, 10 
int 21h

;SCOND-LINE
mov dl, 'U'
int 21h 
mov dl, " "
int 21h
mov cl, 0
mov ch, 6
TOP1:
inc cl 
mov dl, 'N'
int 21h
mov dl, " "
int 21h
cmp cl, ch
jne TOP1
mov dl, 'U'
int 21h 
mov ah, 2
mov dl, 00h ;NEXT LINE
int 21h
mov dl, 10
int 21h

;THIRD-LINE
mov dl, 'U'
int 21h 
mov dl, " "
int 21h
mov dl, 'N'
int 21h 
mov dl, " "
int 21h
mov cl, 0
mov ch, 4
TOP2:
inc cl
mov dl, 'I'
int 21h
mov dl, " "
int 21h
cmp cl, ch
jne TOP2
mov dl, 'N'
int 21h 
mov dl, " "
int 21h
mov dl, 'U'
int 21h 
mov ah, 2
mov dl, 00h ; NEXT LINE
int 21h
mov dl, 10
int 21h

;FOURTH-LINE
mov dl, 'U'
int 21h 
mov dl, " "
int 21h
mov dl, 'N'
int 21h 
mov dl, " "
int 21h
mov dl, 'I'
int 21h 
mov dl, " "
int 21h
mov cl, 0
mov ch, 2

TOP3:
inc cl 
mov dl, 'T'
int 21h
mov dl, " "
int 21h
cmp cl, ch
jne TOP3
mov dl, 'I'
int 21h 
mov dl, " "
int 21h
mov dl, 'N'
int 21h 
mov dl, " "
int 21h
mov dl, 'U'
int 21h 
mov ah, 2
mov dl, 00h ; NEXT LINE
int 21h
mov dl, 10
int 21h

;FIFTH-LINE
mov dl, 'U'
int 21h 
mov dl, " "
int 21h
mov dl, 'N'
int 21h 
mov dl, " "
int 21h
mov dl, 'I'
int 21h 
mov dl, " "     
int 21h
mov cl, 0
mov ch, 2

TOP4:
inc cl 
mov dl, 'T'
int 21h
mov dl, " "
int 21h
cmp cl, ch
jne TOP4
mov dl, 'I'
int 21h 
mov dl, " "
int 21h
mov dl, 'N'
int 21h 
mov dl, " "
int 21h
mov dl, 'U'
int 21h 
mov ah, 2
mov dl, 00h ; NEXT LINE
int 21h
mov dl, 10
int 21h

;SIXTH-LINE
mov dl, 'U'
int 21h 
mov dl, " "
int 21h
mov dl, 'N'
int 21h 
mov dl, " "
int 21h
mov cl, 0
mov ch, 4

TOP5:
inc cl 
mov dl, 'I'
int 21h
mov dl, " "
int 21h
cmp cl, ch
jne TOP5
mov dl, 'N'
int 21h 
mov dl, " "
int 21h
mov dl, 'U'
int 21h ;
mov ah, 2
mov dl, 00h ; NEXT LINE
int 21h
mov dl, 10
int 21h

;SEVENTH-LINE
mov dl, 'U'
int 21h 
mov dl, " "
int 21h
mov cl, 0
mov ch, 6
TOP6:
inc cl 
mov dl, 'N'
int 21h
mov dl, " "
int 21h
cmp cl, ch
jne TOP6
mov dl, 'U'
int 21h 
mov ah, 2
mov dl, 00h ; NEXT LINE
int 21h
mov dl, 10
int 21h

;EIGHTTH-LINE
mov cl, 0
mov ch, 8
TOP8:
inc cl
mov dl, 'U' 
int 21h
mov dl, " "
int 21h
cmp cl, ch
jne TOP8
mov ah, 2
mov dl, 00h ; NEXT LINE
int 21h
mov dl, 10
int 21h
ret
BOX1 endp

;NESTED PATTERN (LOOP)
NEST PROC
 MOV DL, 10
 INT 21H
 MOV AH, 2 
 MOV BL, 5 
 MOV CL, 0
 MOV BH, 1 
 
 TOPRIGHT:
     INC CL
     MOV DL,42
     INT 21H

     CMP CL,BH 
     JE RIGHT2


     CMP CL,6
     JNE TOPRIGHT

     MOV DL,10
     INT 21H
     INC BH
     MOV CL,0
     DEC BL
     CMP BL,0
     JNE TOPRIGHT

     CALL NEST2

RET
NEST ENDP

NEST2 PROC
 MOV DL, 10
 INT 21H
 MOV AH, 2 
 MOV BL, 5
 MOV CL, 0
 MOV BH, 1
 MOV DH, 5
 MOV CH,48

 TOPBOTTOM:
     INC CH
     INC CL
     MOV DL,CH
     INT 21H

     CMP BL,DH
     JE RESET


     CMP CL,5
     JNE TOPBOTTOM

     MOV DL,10
     INT 21H
     INC BH
     MOV CL,0
     MOV CH,48
     DEC BL
     CMP BL,0
     JNE TOPBOTTOM
JMP BEGIN

RET
NEST2 ENDP

end main
