include Irvine32.inc




.data 
	msg11 byte "Enter number ", 0ah, 0dh, 0
	msg21 byte "Number is not prime", 0ah, 0dh, 0
	msg22 byte "Number is prime", 0ah, 0dh, 0
	num11 dword ?
	fac dword ?




.code
main proc
	
	lea edx, msg11
	call writestring
	call readdec	;gets input from user
	mov num11, eax	; saves input as num11
	mov ebx, 2		; sets ebx equal to 2
	cmp num11, ebx		; compares input to 1
	mov ecx, num11 ; sets loop counter = user input number

	jg P2
	jmp STOP

	P2:
		
		mov edx, 0	; sets remainder to 0
		div ebx	; divides user input by 2...
		cmp edx, 0 ; compare remainder to 0
		je P3		
		inc ebx		; if not equal ebx is incremented and process is repeated 
		loop P2

	P5:
		lea edx, msg22
		call writestring
		jmp STOP

	P3:
		lea edx, msg21
		call writestring
		jmp STOP



	STOP:
		call crlf





	


			
	

			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			




		

		
	

	
	



	exit
main endp
end main




		

		
	

	
	



