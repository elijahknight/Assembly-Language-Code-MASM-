; change time proc

INCLUDE Irvine32.inc





.data
	
	Estr1 byte "Enter time in military format ", 0ah, 0dh, 0
	Estr2 byte "Time in usual format = ", 0
	Estr3 byte "Time is noon ", 0ah, 0dh, 0
	Emiltime dword ?
	Ehour dword ?
	Emins dword ?






.code
main proc
	
	call ChangeTime





exit
main endp


ChangeTime proc

	Estart:
		lea edx, Estr1
		call writestring		;GET MILITARY TIME
		call readdec

		
		mov ebx, 1200
		cmp eax, ebx		;CHECK IF NOON, AM, OR PM
		jg PM
		jl AM
		je Noon

	PM:
		mov edx, 0			;CLEAR REMAINDER
		
		mov ebx, 100
		div ebx
		mov ebx, 12
		sub eax, ebx		;GET HOURS AND MINS FROM MILITARY TIME
		mov Ehour, eax
		mov Emins, edx

		lea edx, Estr2
		call writestring
		call writedec			
		
		mov eax, ":"
		call writechar
		
		mov eax, Emins						;PRINT HOURS AND MINS IN STANDARD TIME FORMAT
		call writedec
		
		mov eax, "P"
		call writechar
		call crlf

		jmp Estop


	AM:
		mov edx, 0		;CLEAR REMAINDER
		
		mov ebx, 100			;GET HOURS AND MINS FROM MILITARY TIME
		div ebx
		mov Ehour, eax
		mov Emins, edx

		lea edx, Estr2
		call writestring		;PRINT HOURS AND MINS IN STANDARD TIME FORMAT
		call writedec
		
		mov eax, ":"
		call writechar
		
		mov eax, Emins
		call writedec
		
		mov eax, "A"
		call writechar
		call crlf

		jmp Estop







	Noon:

		lea edx, Estr3
		call writestring				;PRINT NOON IF IT IS NOON

		jmp Estop


	Estop:
		call crlf
		
		ret

	
	
	ChangeTime endp
end main