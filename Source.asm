;Moschos Theodoros
;AEM:2980

.386                      ;Arxikopoioyme thn ekdosi pou tha ektelesoume             
.model flat               ;Arxikopoioume to montelo pou xrhsimopoioume

.data                                   ;Enarxsi tou data segment
intArray DWORD 0,1,2,3,4,5,6,7,8,9              ;Arxikopoihsh tou pinaka intArray ,me times apo to 0 mexri to 9 
reverseArray DWORD 0,0,0,0,0,0,0,0,0,0          ;Arxikopoihsh tou pinaka reverseArray ,me midenikes times
sumArray DWORD 0,0,0,0,0,0,0,0,0,0            ;Arxikopoihsh tou pinaka sumArray ,me midenikes times

.code                              ;Enarxsi tou code segment
start  PROC             ;Enarxsi ths kyrias synarthshs pou ektelei to programma

; Akolouthoun arxikopoihseis ton register pou tha xrhsimopoihthoun gia thn diktodotisi kai to megethos ton pinakon

mov esi,OFFSET intArray           ;Dinoume ston register esi to offset tou pinaka intArray
mov edi,OFFSET intArray          ;Omoios,dinoume ston register edi to offset tou pinaka intArray
mov edx,OFFSET  sumArray         ;Dinoume ston register edx to offset tou pinaka sumArray   
mov ecx, LENGTHOF intArray-1     ;Dinoume ston register ecx to megethos tou pinaka intArray
mov ebp,OFFSET   reverseArray      ;Dinoume ston register edp to offset tou pinaka reverseArray
mov esp,OFFSET  reverseArray     ;Omoios,dinoume ston register esp to offset tou pinaka reverseArray
mov cx,LENGTHOF reverseArray-1   ;Dinoume ston register cx to megethos tou pinaka reverseArray

mov eax,0            ;Dinoume arxiki timh ston register eax to mhden
L1:                       ;Enarxsi epanaliptikhs diadikasias
add eax,[edi]                   ;Prosthsi ston eax ,ths timhs poy yparxei sth thesi mnhmhs tou edi
add edi,TYPE intArray           ;Auxsisi ths timhs sthn opoia deixneio  o edi ston pinaka intArray,oste meta to peras tis epanalhpsis na deixnei sto telos tou pinaka
add esp,TYPE reverseArray       ;Auxsisi ths timhs sthn opoia deixneio o esp ston pinaka revesreArray,oste meta to peras tis epanalhpsis na deixnei sto telos tou pinaka
mov [edx],eax                  ;Topothetisi tis timhs tou eax sth thesi mnhmhs pou deixnei kathe fora o edx
add edx,TYPE sumArray          ;Afxsisi tou dikti edx ,oste kathe fora na deixnei thn antistoixi thesi tou pinaka
LOOP L1                       ;Entolh oste na metaferthoume pali sthn arxi ths epanaliptikhs diadikasias

add eax,[edi]                ;Prosthesi ths timhs ths teleytaias thesis tou pinaka intArray ston eax
mov[edx],eax                   ;Topothetisi ths telikhs timhs sth thesi mnhmhs tou edx


mov ecx,LENGTHOF intArray           ;Epanaprosdiorismos tou megethous tou pinaka intArray
mov cx,LENGTHOF  reverseArray          ;Epanaprosdiorismos tou megethous tou pinaka reverseArray

L2:                    ;Enarxsi epanaliptikhs diadikasias
mov eax,[esi]          ;Topothetoume thn timh ths mhnmhs tou esi ston eax
mov ebx,[edi]           ;Topothetoume thn timh ths mhnmhs tou edi ston ebx
xchg eax,ebx           ;Pragmatopoioumai antalagi ton timon
mov [ebp],eax          ; Antistoixa ,topouetoume thn timh tou eax sthn thesi mnhmhs tou ebp
mov [esp],ebx             ; Antistoixa ,topouetoume thn timh tou ebx sthn thesi mnhmhs tou esp
add esi,TYPE intArray       ;Auxsanoume thn timh tou deikti esi kata ena
sub edi,TYPE intArray          ;Meionoume thn timh tou deikti edi kata ena
add ebp,TYPE reverseArray        ;Auxsanoume thn timh tou deikti ebp kata ena
sub esp,TYPE reverseArray        ;Auxsanoume thn timh tou deikti esp kata ena
dec ECX                      ;Meiosi tou ecx kata ena
dec CX                  ;Meiosi tou cx kata ena
LOOP L2                 ;Entolh oste na metaferthoume pali sthn arxi ths epanaliptikhs diadikasias

ret                    ;Epistrofh ton timon pou upologizontai
start endp
end start                 ;Telos synarthshs kai ekteleshs tou progreammatos