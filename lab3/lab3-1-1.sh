#!/bin/bash
echo -n "" > lab/3-1-1.txt
for cpu_type in AtomicSimpleCPU TimingSimpleCPU 
do
	for clk_rate in 1 1.5 2 2.5 3 3.5 4
	do

		build/X86/gem5.opt configs/example/se.py --cmd=lab/prime0 --cpu-type=$cpu_type --sys-clock="$clk_rate"GHz --l1d_size=64kB --l1i_size=16kB --caches
		echo -e "CPU Type:$cpu_type\nClock Rate:$clk_rate"GHz"" >> lab/3-1-1.txt
		echo -n "Sim Seconds:" >> lab/3-1-1.txt
		grep -Po "(?<=sim_seconds).*(?=#)" m5out/stats.txt | sed s/[[:space:]]//g >> lab/3-1-1.txt
		echo -n "Sim Ticks:" >> lab/3-1-1.txt
		grep -Po "(?<=sim_ticks).*(?=#)" m5out/stats.txt | sed s/[[:space:]]//g >> lab/3-1-1.txt
		echo "" >> lab/3-1-1.txt	

	done
done		 
		
