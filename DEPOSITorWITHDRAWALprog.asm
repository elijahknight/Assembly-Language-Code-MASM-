TITLE performs withdrawal or deposit by user request then outputs final balance
INCLUDE Irvine32.inc

.data
	str1 byte "input initial amount in the account: ", 0
	str2 byte "enter 0 to make a deposit, 1 to make a withdrawal: ",  0
	str3 byte "how much would you like to deposit? ", 0
	str4 byte "how much would you like to withdrawal? ", 0
	str5 byte "your new balance is: ", 0
	choice dword ?
	amount dword ?



.code
main proc
	
	; ask user to input init amount
	lea edx, str1
	call writestring
	call readdec
	mov amount, eax

	;ask user for withdrawal or deposit

	lea edx, str2
	call writestring
	call readdec
	mov choice, eax
	cmp choice, 0
	jg withdrawal
	mov edx, offset str3
	call writestring
	call readdec
	;eax has amount of the deposit
	add eax, amount
	; eax has updated amount
	mov edx, offset str5
	call writestring
	call writedec
	jmp done

	withdrawal:
		mov edx, offset str4
		call writestring
		call readdec
		;eax has amount of the withdrawal
		sub amount, eax
		mov eax, amount
		;eax has updated amount
		lea edx, str5
		call writestring
		call writedec

		done:
			call crlf
			exit

		main endp
		end main




