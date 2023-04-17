#!/bin/sh
./bf_0 e input_small.asc output_small.enc 1234567890abcdeffedcba0987654321
./bf_0 d output_small.enc output_small.asc 1234567890abcdeffedcba0987654321
build/X86/gem5.opt --debug-flags=MemoryAccess --debug-file=blowfish_0_trace.txt configs/example/se.py --cmd=/home/ead/yihui/Downloads/gem5/lab4/lab4/blowfish/bf_0 --cpu-type=TimingSimpleCPU --options=" e input_small.asc output_small.enc 1234567890abcdeffedcba0987654321"