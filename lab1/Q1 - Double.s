.data
	# Prepare data
	CONTROL:	.word32 0x10000
	DATA:		.word32 0x10008
	A:		.double 2063
	B: 		.double 36725
	C:		.space 16
	I:		.double 12
	J:		.double 15
	M:		.double 2
	N:		.double 4
	ONE:		.double 1
	EVEN:		.asciiz " Even:"
	ODD:		.asciiz " Odd:"

.text
main:
	# Load data to register
	l.d f0, A($zero)
	l.d f1, B($zero)
	l.d f2, C($zero)
	l.d f3, I($zero)
	l.d f4, J($zero)
	l.d f5, M($zero)
	l.d f6, N($zero)
	l.d f7, ONE($zero)


loop:
	# Convert float to integer
	cvt.l.d f20, f3
	cvt.l.d f21, f4
	mfc1 $s0, f20
	mfc1 $s1, f21
	# Judge if i<15
	slt $t0, $s0, $s1
	beq $t0, $zero, done
	mul.d f8, f0, f5
	mul.d f9, f1, f6
	add.d f2, f8, f9
	add.d f2, f2, f7
	s.d f2, C($zero)
	div.d f10, f2, f5
	mul.d f11, f10, f5

	cvt.l.d f20, f11
	cvt.l.d f21, f2
	mfc1 $s0, f20
	mfc1 $s1, f21
	# Judge if even and jump to even function
	bne $s0, $s1, even

	daddi $t0, $zero, 4
	daddi $t1, $zero, ODD
	lwu $t5, DATA($zero)
	lwu $t6, CONTROL($zero)
	sd $t1, ($t5)
	sd $t0, ($t6)
	daddi $t0, $zero, 3
	
	s.d f2, ($t5)
	sd $t0, ($t6)
	add.d f3, f3, f7
	j loop

even:
	daddi $t0, $zero, 4
	daddi $t1, $zero, EVEN
	lwu $t5, DATA($zero)
	lwu $t6, CONTROL($zero)
	sd $t1, ($t5)
	sd $t0, ($t6)
	daddi $t0, $zero, 3
	s.d f10, ($t5)
	sd $t0, ($t6)
	add.d f3, f3, f7
	j loop

	
	
done:
	halt