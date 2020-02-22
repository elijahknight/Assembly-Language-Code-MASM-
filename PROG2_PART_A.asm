
INCLUDE Irvine32.inc



.data
	Ainputnum dword ?
	Anum dword ?
	Anum2 dword ?
	Anum3 dword ?
	Astr1 byte "Binary number = ", 0
	Astr2 byte "Input number to be converted ", 0ah, 0dh, 0
	Astr3 byte "Hex number = ", 0




.code
main proc

	call ChangeBase

	exit
	
main endp

ChangeBase proc
	
	lea edx, Astr2
	call writestring	;ask user for number to be converted
	call readdec	;get input number
	mov Ainputnum, eax	;save eax to inputnum
	mov ecx, 0		;clear loop counter
	mov Anum, eax		;save what is in eax to Anum

binary:
	mov eax, Anum
	mov edx, 0		;clear remainder
	
	mov ebx, 2		;set ebx to be divisor

	div ebx		;divide for binary
	mov Anum, eax	;save eax to Anum
	push edx		;push remainder to stack
	
	inc ecx		;increment counter for print purpose (will be used as loop counter for popping stack)
	
	cmp eax, 0		;compare quotient to 0 to check if done
	jg binary	;if less than 0 then binary number has been calculated
	


	lea edx, Astr1
	call writestring	
printbinary:
	
	
	
	
	pop eax						;pop binary number digit by digit and print it
	call writedec
	
	loop printbinary
	mov eax, Ainputnum
	mov ecx, 0
	mov Anum, eax
hex:
	
	mov eax, Anum	;starts with input number
	mov edx, 0		;clear remainder
	mov ebx, 16

	div ebx		;divide for binary
	mov Anum, eax	;save eax to Anum
	push edx		;push remainder to stack
	
	inc ecx		;increment counter (will be used as loop counter for popping stack)
	
	cmp eax, 0		;compare quotient to 0 to check if done
	jg hex		;if less than 0 then binary number has been calculated

	call crlf
	
	lea edx, Astr3
	call writestring
printhex:
	mov edx, 0	;clear remainder
		
	pop eax		;pop binary number digit by digit and print it
	cmp eax, 9	;check to see if printing num or letter
	jg table	;if greater than 9 we have to print letter
	call writedec
	cmp ecx, 0
	jg printhex
	jmp Aend1

table:
	cmp eax, 10		;print a for 10
	jne printB
	mov al, "A"
	call writechar
	jmp printG
	
	printB:		;print b for 11
	
	cmp eax, 11
	jne printC
	mov al, "B"
	call writechar
	jmp printG
	
	printC:		;print c for 12
	
	cmp eax, 12
	jne printD
	mov al, "C"
	call writechar
	jmp printG
	
	printD:		;print d for 13

	cmp eax, 13
	jne printE
	mov al, "D"
	call writechar
	jmp printG
	
	printE:		;print e for 14

	cmp eax, 14
	jne printF1
	mov al, "E"
	call writechar
	jmp printG
	
	printF1:		;print f for 15

	cmp eax, 15
	jne printG
	mov al, "F"
	call writechar

	printG:			;loop back to printhex

	loop printhex

	

	
		



		Aend1:
			
	
	ret

 ChangeBase endp


end main