#!/bin/bash

build/X86/gem5.opt --debug-flags=MemoryAccess --debug-file=blowfish_0_trace.txt configs/example/se.py --cmd=/home/ead/yihui/Downloads/gem5/lab4/lab4/blowfish/bf_0 --cpu-type=TimingSimpleCPU --options=" e /home/ead/yihui/Downloads/gem5/lab4/lab4/blowfish/input_small.asc /home/ead/yihui/Downloads/gem5/lab4/lab4/blowfish/output_small.enc 1234567890abcdeffedcba0987654321"
build/X86/gem5.opt --debug-flags=MemoryAccess --debug-file=blowfish_3_trace.txt configs/example/se.py --cmd=/home/ead/yihui/Downloads/gem5/lab4/lab4/blowfish/bf_3 --cpu-type=TimingSimpleCPU --options=" e /home/ead/yihui/Downloads/gem5/lab4/lab4/blowfish/input_small.asc /home/ead/yihui/Downloads/gem5/lab4/lab4/blowfish/output_small.enc 1234567890abcdeffedcba0987654321"
build/X86/gem5.opt --debug-flags=MemoryAccess --debug-file=string_3.txt configs/example/se.py --cmd=/home/ead/yihui/Downloads/gem5/lab4/lab4/stringsearch/search_small_3 --cpu-type=TimingSimpleCPU --options=" > /home/ead/yihui/Downloads/gem5/lab4/lab4/stringsearch/output_small.txt"