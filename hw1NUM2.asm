
include Irvine32.inc




.data 
	msg1 byte "Enter larger value number", 0ah, 0dh, 0
	msg2 byte "Enter smaller value number", 0ah, 0dh, 0
	msg3 byte "GCD is ", 0ah, 0dh, 0
	val1 dword ?
	val2 dword ?
	remaindercheck dword ?
	val0 dword 0



.code
main proc

		lea edx, msg1
		call writestring
		call readdec
		
		mov val1, eax

		lea edx, msg2
		call writestring
		call readdec

		mov val2, eax
	L6:
		cmp val1, eax

		je L3 ; step x
		jg L4 ; step v
		jl L7
		 

		L3:

			mov val2, eax
			lea edx, msg3
			call writestring
			call writedec
			jmp stop

		L8:
			mov val1, eax
			lea edx, msg3
			call writestring
			call writedec
			jmp stop
			

		L4:

			mov edx, 0
			mov eax, val2
			mov ebx, val1
			div ebx
			mov remaindercheck, edx
			mov remaindercheck, eax 
			cmp val0, eax
			jg L5
			je L3

		L7:
			mov edx, 0
			mov eax, val1
			mov ebx, val2
			div ebx
			mov remaindercheck, edx
			mov remaindercheck, eax 
			cmp val0, eax
			jg L5
			je L8

		L5:

			mov remaindercheck, eax
			jmp L6

		stop:

		call crlf
		exit


			
	

			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			




		

		
	

	
	




main endp
end main




		

		
	

	
	



