

INCLUDE Irvine32.inc



.data
	
	Bstr4 byte "New value = ", 0
	Bstr3 byte "Invalid entry try again", 0ah, 0dh, 0
	Bstr2 byte "Enter value to be converted ", 0ah, 0dh, 0
	Bstr1 byte "Would you like to convert yards to feet (1), convert yards to inches (2), or convert feet to inches (3) or exit (4)", 0ah, 0dh, 0
	Bvalue dword ?
	Bconversion dword ?
	Bnewval dword ?



.code
main proc
	
	call ConvertLength

	exit
main endp



ConvertLength proc

Bstart:	
	lea edx, Bstr1
	call writestring		;ask user what they want to convert
	call readdec
	cmp eax, 1		;compare input to see what their choice is
	je YtoF
	cmp eax, 2
	je YtoI
	cmp eax,3
	je FtoI
	cmp eax,4
	je Bstop
	jmp errormes			;if not a valid selection --- error message and try again




	YtoF:
		lea edx, Bstr2
		call writestring		;takes yards to convert
		call readdec

		
		mov ebx, 3
		mul ebx					;multiplies by 3 to get conversion
		mov Bnewval, eax
		
		lea edx, Bstr4
		call writestring
		call writedec				;gives output
		call crlf

		jmp Bstop

	YtoI:
		lea edx, Bstr2
		call writestring				;takes yards to convert
		call readdec
		
		
		mov ebx, 36
		mul ebx							;converts yards to inches
		mov Bnewval, eax
		
		lea edx, Bstr4
		call writestring				;gives output
		call writedec
		call crlf

		jmp Bstop

	FtoI:
		lea edx, Bstr2
		call writestring			;takes feet to convert
		call readdec
		
		
		mov ebx, 12
		mul ebx
		mov Bnewval, eax					;converts feet to inches
		
		lea edx, Bstr4
		call writestring
		call writedec					;gives output
		call crlf

		jmp Bstop

	errormes:
		lea edx, Bstr3
		call writestring		;throws error message
		jmp Bstart
	
	Bstop:
		call crlf 
		ret
		
	ConvertLength endp


end main