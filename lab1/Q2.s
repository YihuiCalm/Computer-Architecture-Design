.data
	# Prepare data
	A:	.word 15
	N:	.double 8
	R:	.double 0
	RD:	.double 0

.text
main:
	# Load data to register
	ld $s0, A($zero)
	daddi $s0, $s0, 1
	daddi $t0, $zero, 1
	

loop:
	daddi $s1, $s1, 1
	# judge if i<15
	beq $s1, $s0, done
	dmul $t0, $t0, $s1
	sd $t0, R($zero)

	j loop



done:
	l.d f0, N($zero)
	# convert the float to integer for output
	mtc1 $t0, f1
	cvt.d.l f1, f1
	div.d f2, f1, f0
	s.d f2, RD($zero)
	
	halt