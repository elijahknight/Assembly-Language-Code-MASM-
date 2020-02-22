

INCLUDE Irvine32.inc



.data
	
	Cstr4 byte "New value = ", 0
	Cstr3 byte "Invalid entry try again", 0ah, 0dh, 0
	Cstr2 byte "Enter value to be converted ", 0ah, 0dh, 0
	Cstr1 byte "Would you like to convert pounds to ounces (1), convert kilograms to pounds (2), or convert kilograms to grams (3)", 0ah, 0dh, 0
	Cvalue dword ?
	Cconversion dword ?
	Cnewval dword ?



.code
main proc
	
	call ConvertWeight

	exit
main endp



ConvertWeight proc

Cstart:	
	lea edx, Cstr1
	call writestring		;GET USER CHOICE FOR CONVERSION
	call readdec
	cmp eax, 1
	je PtoO
	cmp eax, 2
	je KtoP					;JUMP TO APPROPRIATE SECTOR ACCORDING TO CHOICE
	cmp eax,3
	je KtoG
	jmp Cerrormes				;EXCEPTION HANDLER FOR INVALID ENTRY




	PtoO:
		lea edx, Cstr2
		call writestring		;GET POUNDS TO BE CONVERTED
		call readdec

		
		mov ebx, 16
		mul ebx					;CONVERT POUNDS TO OUNCES
		mov Cnewval, eax
		
		lea edx, Cstr4
		call writestring
		call writedec			;GIVE OUTPUT
		call crlf
		jmp Cstop

	KtoP:
		lea edx, Cstr2
		call writestring			;GET KILOGRAMS TO BE CONVERTED
		call readdec
		
		
		mov ebx, 2
		mul ebx						;CONVERT KILOGRAM TO POUNDS
		mov Cnewval, eax
		
		lea edx, Cstr4
		call writestring				;GIVE OUTPUT
		call writedec
		call crlf
		jmp Cstop

	KtoG:
		lea edx, Cstr2
		call writestring			;GET KILOGRAMS TO BE CONVERTED
		call readdec
		
		
		mov ebx, 1000
		mul ebx
		mov Cnewval, eax				;CONVERT KILOGRAMS TO GRAMS
		
		lea edx, Cstr4
		call writestring
		call writedec					;GIVE OUTPUT
		call crlf
		jmp Cstop

	Cerrormes:
		lea edx, Cstr3
		call writestring			;GIVE ERROR MESSAGE
		jmp Cstart

	Cstop:
		call crlf
		ret

		
	ConvertWeight endp


end main