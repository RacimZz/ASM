%include "asm_io.asm"
global main 

segment .data
msg1 : dd "A= ", 0
msg2 : dd "B= ", 0
msg3 : dd "ce nombre est premier et il est compris entre A et B : ", 0
msg4 : dd "La somme est  ", 0
i : dd 0
test : dd 5    
segment .bss
A resd 1
B resd 1
R resd 1
S resd 1

segment .text
main :
mov eax, msg1
call print_string
call read_int 
mov ebx, eax
mov [A], ebx
mov eax, msg2
call print_string
call read_int 

boucle :
cmp ebx, eax
jne incrementation 
jmp fini

incrementation :
push ebx
inc ebx
jmp boucle

fini :


sub eax, [A]
mov [B], eax

boucle2 :
mov eax, [B]
cmp [i], eax
jne pasEncore

jmp fin

pasEncore :
pop eax
mov [R], eax     ;juste pour sauvegarder sa valeur
mov ecx, 2     ;on commence la verification de 2 si on trouve un diviseur donc il n'est pas premier

boucle3 :
mov eax, [R]    ; la variable R je l'utillise pour sauvegarder la valeur de eax
cmp ecx, eax

jne verif
mov eax, msg3
call print_string
mov eax, [R]
add [S], eax
call print_int
call print_nl

inc dword[i]
jmp boucle2
verif :
div ecx
cmp edx, 0
je paspremier
inc ecx
mov edx, 0
jmp boucle3

paspremier :
mov dword[test], 4   ;pour me prevenir qu'il nest pas premier
inc dword[i]
mov edx, 0
jmp boucle2


fin :
mov eax, msg4
call print_string
mov eax, [S]
call print_int

mov ebx, 0
mov eax, 1
int 0x80


    

