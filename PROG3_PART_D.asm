

INCLUDE Irvine32.inc



.data
	
	Dstr4 byte "New value = ", 0
	Dstr3 byte "Invalid entry try again", 0ah, 0dh, 0
	Dstr2 byte "Enter value to be converted ", 0ah, 0dh, 0
	Dstr1 byte "Would you like to convert US dollars to Euro (1), convert US dollar to Mexican Peso (2), or convert US dollar to Russian Rubic (3)", 0ah, 0dh, 0
	Dvalue dword ?
	Dconversion dword ?
	Dnewval dword ?



.code
main proc
	
	call ConvertCurrency

	exit
main endp



ConvertCurrency proc

Dstart:	
	lea edx, Dstr1
	call writestring		;GET SELECTION FROM USER AS TO WHICH CURRENCY THEY WANT TO CONVERT
	call readdec
	
	
	
	cmp eax, 1
	je DtoE					;JUMP TO APPROPRIATE SECTOR BASED ON SELECTION
	
	cmp eax, 2
	je DtoP
	
	cmp eax,3
	je DtoR
	
	jmp Derrormes			;EXCEPTION HANDLER FOR INVALID ENTRY




	DtoE:
		lea edx, Dstr2
		call writestring		;GET DOLLARS TO BE CONVERTED
		call readdec

		mov Dvalue, eax
		mov ebx, 1			;CONVERT DOLLARS TO EUROS
		mul ebx
		mov Dnewval, eax
		
		lea edx, Dstr4
		call writestring		;GIVE OUTPUT
		call writedec
		call crlf
		
		jmp Dstop

	DtoP:
		lea edx, Dstr2
		call writestring			;GET DOLLARS TO BE CONVERTED
		call readdec
		
		mov Dvalue, eax
		mov ebx, 19
		mul ebx						;CONVERT DOLLARS TO PESOS
		mov Dnewval, eax
		
		lea edx, Dstr4
		call writestring			;GIVE OUTPUT
		call writedec
		call crlf

		jmp Dstop

	DtoR:
		lea edx, Dstr2
		call writestring			;GET DOLLARS TO BE CONVERTED
		call readdec
		
		mov Dvalue, eax
		mov ebx, 64					;CONVERT DOLLARS TO RUSSIAN RUBICS
		mul ebx
		mov Dnewval, eax
		
		lea edx, Dstr4
		call writestring			;GIVE OUTPUT
		call writedec
		call crlf

		jmp Dstop

	Derrormes:
		lea edx, Dstr3			;ERROR MESSAGE FOR INVALID ENTRY
		call writestring
		jmp Dstart

	Dstop:

	call crlf
	ret

		
	ConvertCurrency endp


end main