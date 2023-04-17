.data
	# Prepare data
	CONTROL:	.word32 0x10000
	DATA:		.word32 0x10008
	A:		.word 2063
	B: 		.word 36725
	C:		.space 16
	I:		.word 12
	J:		.word 15
	EVEN:		.asciiz " Even:"
	ODD:		.asciiz " Odd:"

.text
main:
	# Load data to register
	ld $s0, A($zero)
	ld $s1, B($zero)
	ld $s2, C($zero)
	ld $s3, I($zero)
	ld $s4, J($zero)
	daddi $s5, $zero, 2
	daddi $s6, $zero, 4

loop:
	# judge if i<15
	slt $t0, $s3, $s4
	beq $t0, $zero, done
	# Multiplication
	dmul $t1, $s0, $s5
	dmul $t2, $s1, $s6
	dadd $s2, $t1, $t2
	daddi $s2, $s2, 1
	# Store the result of C
	sd $s2, C($zero)
	ddiv $t3, $s2, $s5
	dmul $t4, $t3, $s5
	# Judge if even and jump to even function
	beq $t4, $s2, even
	# prepare to output
	daddi $t0, $zero, 4
	daddi $t1, $zero, ODD
	lwu $t5, DATA($zero)
	lwu $t6, CONTROL($zero)
	sd $t1, ($t5)
	sd $t0, ($t6)
	daddi $t0, $zero, 2
	dadd $t1, $zero, $s2
	sd $t1, ($t5)
	sd $t0, ($t6)
	daddi $s3, $s3, 1
	j loop

even:
	daddi $t0, $zero, 4
	daddi $t1, $zero, EVEN
	lwu $t5, DATA($zero)
	lwu $t6, CONTROL($zero)
	sd $t1, ($t5)
	sd $t0, ($t6)
	daddi $t0, $zero, 2
	dadd $t1, $zero, $t3
	sd $t1, ($t5)
	sd $t0, ($t6)
	daddi $s3, $s3, 1
	j loop

	
	
done:
	halt