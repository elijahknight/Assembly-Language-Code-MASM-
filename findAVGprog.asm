TITLE while loop
INCLUDE Irvine32.inc

.data
	num dword ?
	sum dword 0
	avg dword ?
	count dword 0
	str1 byte "Read several numbers, end it with 0", 0ah, 0dh, 0
	str2 byte "avg = ", 0


.code
main proc
	
	lea edx, str1	;print statement
	call writestring

	call readdec

start:
	cmp eax, 0
	je stop
	add sum, eax
	inc count
	call readdec		;Read the next number
	jmp start

stop:
	call findAvg
	exit
main endp

	findAvg	proc
		mov edx, 0
		mov eax, sum
		mov ebx, count
		div ebx
		
		lea edx, str2
		call writestring
		call writedec
		call crlf
	findAvg endp
	ret

	end main


