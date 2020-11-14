#include<p18F4550.inc>

		org	0x00
		goto start
		org	0x08
		retfie
		org	0x18
		retfie
		
n		equ D'7'
i		set	0x03
sum		set	0x06

start	clrf	sum, A
		clrf	i, A
		
loop	movlw	n
		cpfsgt	i, A
		bra		sum_lp
		bra		exit_lp
		
sum_lp	movf	i, W, A
		addwf	sum, F, A
		incf	i, F, A
		bra		loop
		
exit_lp	nop
		movwf	0x20, A
		end