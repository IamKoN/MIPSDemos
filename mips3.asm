#Consider, for example, how you would end up at the first add 
#(i.e. add $t3 , $t0 , $t2):

#bge $t1 ,$t0 , MAXA would have to be taken, so $t1 >= $t0.
#bge $t2,$t1,MAXB1 would have to be not taken, so $t1 > $t2.

#These conditions would be true e.g. for the input $t0=1, $t1=3, $t2=2.
 #The result one would expect is 5 (3 + 2), i.e. $t1 + $t2. 
# But the result your program would yield is 3 ($t0 + $t2 ==  1 + 2).

.text #Abilita gli input/output di testo

main:                              # la funzione main è sempre chiamata in qualsiasi programma mips, qui parte il programma
    la $a0 , main_program_string   #Carico in memoria l'indirizzo della stringa main_program_string e la memorizzo nell' argument register 0
    li $v0 , 4                     # Carico il valore 4 nel registro $v0 che è il codice operatore per il print delle stringhe
    syscall                        #leggo il registro $v0 vrfr 4 e printa la stringa 

    la $a0 , first_number_string   #Carico in memoria l'indirizzo della stringa first_number_string e la memorizzo nell' argument register 0
    li $v0 , 4                     # Carico il valore 4 nel registro $v0 che è il codice operatore per il print delle stringhe
    syscall                        #leggo il registro $v0 vrfr 4 e printa la stringa 

    li $v0, 5                      # load syscall read_int into $v0
    syscall                        # make the syscall
    move $t0, $v0                  # move the number read into $t1



    la $a0 , second_number_string   #Carico in memoria l'indirizzo della stringa first_number_string e la memorizzo nell' argument register 0
    li $v0 , 4                     # Carico il valore 4 nel registro $v0 che è il codice operatore per il print delle stringhe
    syscall                        #leggo il registro $v0 vrfr 4 e printa la stringa 

    li $v0, 5                      # load syscall read_int into $v0
    syscall                        # make the syscall
    move $t1, $v0                  # move the number read into $t1

    la $a0 , third_number_string   #Carico in memoria l'indirizzo della stringa first_number_string e la memorizzo nell' argument register 0
    li $v0 , 4                     # Carico il valore 4 nel registro $v0 che è il codice operatore per il print delle stringhe
    syscall                        #leggo il registro $v0 vrfr 4 e printa la stringa 

    li $v0, 5                      # load syscall read_int into $v0
    syscall                        # make the syscall
    move $t2, $v0                  # move the number read into $t1


    bge $t1 ,$t0 , MAXA
    j MAXC

MAXA : 
    bge $t2,$t1,MAXB1
    add $t3 , $t0 , $t2
    j DONE
MAXB1 : 
    add $t3 , $t0 , $t1
    j DONE
MAXC : 
    bge $t2,$t0,MAXC1
    add $t3 , $t1 , $t2
    j DONE
MAXC1 : 
    add $t3 , $t0 , $t1
    j DONE

DONE : 
    la $a0 , response_string   #Carico in memoria l'indirizzo della stringa first_number_string e la memorizzo nell' argument register 0
    li $v0 , 4                     # Carico il valore 4 nel registro $v0 che è il codice operatore per il print delle stringhe
    syscall                        #leggo il registro $v0 vrfr 4 e printa la stringa 

    li $v0, 1 # load system call (print integer) into syscall register
    move $a0, $t3 # load argument for syscall
    syscall # print element
end: jr $ra 



.data # indica al processore che gli vengono passati dei dati


main_program_string:
    .asciiz "Il programma ti permette di inserire 3 numeri interi e ottenere la somma dei due maggiori\n"

first_number_string:
    .asciiz "Inserire il primo numero intero\n"

second_number_string:
    .asciiz "Inserire il secondo numero intero\n"

third_number_string:
    .asciiz "Inserire il terzo ed ultimo numero intero\n"

response_string:
    .asciiz "\nIl valore della somma dei due numeri maggiori è pari a : "