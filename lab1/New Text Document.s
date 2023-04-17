.data
	A:	.word 2063
	B:	.word 2063

.text
main:
	ld r1, A($zero)
	ld r4, B($zero) 
loop:
	sd r0, 0(r1)
	beq r1,r4, loop