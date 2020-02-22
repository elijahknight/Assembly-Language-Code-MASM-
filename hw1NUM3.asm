include Irvine32.inc




.data 
	msg11 byte "Enter number ", 0ah, 0dh, 0
	msg12 byte "Factors are ", 0ah, 0dh, 0
	num11 dword ?
	fac dword ?




.code
main proc
	
	lea edx, msg11
	call writestring
	call readdec	;gets input from user
	mov num11, eax	; saves input as num11
	mov ebx, 1		; sets ebx equal to 1
	cmp num11, ebx		; compares input to 1
	jg P2
	call writedec
	inc ebx
	jmp STOP

	P2:
		mov eax, num11
		cmp num11, ebx
		je P4
		mov edx, 0	; sets remainder to 0
		div ebx	; divides user input by 1...
		cmp 0, edx ; compare remainder to 0
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
		call writedec
		jmp STOP

	STOP:
		call crlf





	


			
	

			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			




		

		
	

	
	



	exit
main endp
end main




		

		
	

	
	



