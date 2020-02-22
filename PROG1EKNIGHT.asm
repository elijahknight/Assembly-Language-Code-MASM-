
include Irvine32.inc

.data
	str1 byte "Enter number to be reversed ", 0
	digit dword 0
	revnum dword 0
	num1 dword ?
	num2 dword 0
	
	str31 byte "Enter first number", 0ah, 0dh, 0
	str32 byte "Enter second number", 0ah, 0dh, 0
	str33 byte "GCD is = ",0
	num31 dword ?
	num32 dword ?
	GCD dword ?
	
	msg11 byte "Enter number ", 0ah, 0dh, 0
	msg12 byte " Factors are ", 0ah, 0dh, 0
	num11 dword ?
	fac dword ?
	
	str41 byte "Enter number", 0ah, 0dh, 0
	str42 byte "Number is prime", 0ah, 0dh, 0
	str43 byte "Number is not prime", 0ah, 0dh, 0
	num41 dword ?

.code
main proc

;NUMBER 1

	lea edx, str1
	call writestring
	call readdec	; Gets number to be reversed from user (In EAX)
	mov num1, eax
	
	target:
		mov edx, 0	;clear remainder
		mov eax, num1	; puts input into eax
		mov ebx, 10		;move 10 into ebx to for division (checks for how many digits are left in number)
		div ebx	; divides
		mov num1, eax 
		mov digit, edx ; saves remainder as digit
		mov eax, digit
		call writedec	;writes digit 
		mov eax, num1	;check to see if there is more than one digit left
		cmp eax, 10
		jge L1 ;	;if more than one digit loop 
		jl L2 ; if one digit then print digit

		L1:
			mov eax, num1

			loop target

		L2:

			mov eax, num1
			call writedec

			jmp stop1

		stop1:

			call crlf
			
;NUMBER 2 
		
	lea edx, str31
	call writestring
	call readdec		;get first num
	mov num31, eax
	
	lea edx, str32
	call writestring
	call readdec		;get second num
	mov num32, eax

	mov ebx, 1		;set ebx to one 

	GCDLoop:
		mov edx, 0	;clear remainder
		mov eax, num31	
		div ebx		;div first num by 1,2,3,4...
		push edx	;push remainder to stack

		mov edx, 0	;clear remainder
		mov eax, num32	;divide second num by 1,2,3,4...
		div ebx

		cmp edx, 0	; compare remainder to 0
		jne Q1		;if not equal jump to q1

		pop edx	;pop remainder from first num from stack
		cmp edx, 0	;compare to 0
		jne Q1		; if not equal jump to q1

		mov GCD, ebx

		Q1:
			pop edx
			inc ebx
			cmp ebx, num31		;makes sure ebx incrementer is not greater than first num to loop or not to loop
			jg Q2
			jmp GCDLoop
			
			Q2:
				mov eax, GCD
				lea edx, str33
				call writestring		; print GCD
				call writedec
				call crlf

;NUMBER 3
	
	lea edx, msg11
	call writestring
	call readdec	;gets input from user
	mov num11, eax	; saves input as num11
	mov ebx, 1		; sets ebx equal to 1
	cmp num11, ebx		; compares input to 1
	jg P2
	call writedec
	inc ebx
	jmp STOP3

	P2:
		
		mov eax, num11
		cmp num11, ebx
		je P4
		mov edx, 0	; sets remainder to 0
		div ebx	; divides user input by 1.2.3.4..
		cmp edx, 0 ; compare remainder to 0
		je P3		; if it equals 0 then it is a factor and needs to be printed and ebx incremented
		inc ebx		; if not equal ebx is incremented and process is repeated 
		jmp P2

	P3:
		
		mov fac, ebx ; save factor as fac
		mov eax, fac	; mov fac into eax to be written
		lea edx, msg12
		call writestring
		call writedec	; write factor
		inc ebx		; increment ebx
		jmp P2		; jump to p2 to start again

	P4: 
		call crlf
		call writedec
		jmp STOP3

	STOP3:
		
		call crlf

;NUMBER 4 (This one does not work, it prints that every number is not prime)(I have looked over it countless times and am missing the error)

	lea edx, str41
	call writestring
	call readdec
	mov eax, num41 ; save input as num41

	mov ebx, 2	;set divisor to start at 2
	
		Prime:
			mov edx, 0
			mov eax, num41	;clear remainder, move input to num41
			div ebx		;divide by 2,3,4,....
			cmp edx, 0		;compare remainder to 0
			je notprime			; if remainder is 0 then number is not prime

			inc ebx			;increment ebx
			mov eax, num41		;move input num to eax
			cmp ebx, num41		;compare incrementing number to input number
			je primenum			;if equal then jump to prime number because no number between 2 and input number gave remainder of 0
			jne Prime			; if not equal then keep looping

				notprime:
					lea edx, str43
					call writestring	;prints that num is not prime
					jmp stop4

				primenum:
					lea edx, str42
					call writestring		;prints that num is prime
					jmp stop4

				stop4:
				call crlf


			
			
			
			
	
	
	
	exit


	
main endp
end main