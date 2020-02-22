
include Irvine32.inc

.data
	str1 byte "Enter number to be reversed ", 0
	digit dword 0
	revnum dword 0
	num1 dword ?
	num2 dword 0
msg1 byte "Enter first number", 0ah, 0dh, 0
	msg2 byte "Enter second number", 0ah, 0dh, 0
	msg3 byte "GCD is ", 0
	val1 dword ?
	val2 dword ?
	remaindercheck dword 0
	val0 dword 0


.code
main proc

; number 1

	lea edx, str1
	call writestring
	call readdec	; Gets number to be reversed from user (In EAX)
	mov eax, num1
	
	target:
		mov ebx, 10
		div ebx	; 56 / 10
		mov num2, eax ; num 2 = 5
		mov digit, edx ; digit = 6
		mov eax, digit
		call writedec
		cmp num2, 10
		jge L1 ; 
		jl L2 ; print num2

		L1:
			mov eax, num2

			loop target

		L2:

			mov eax, num2
			call writedec

			jmp stop

		stop:

			call crlf
			exit


		

		
	

	
	




main endp
end main
