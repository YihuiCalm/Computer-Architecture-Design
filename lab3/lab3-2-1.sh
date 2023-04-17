#!/bin/bash
file=lab/3-2-1.txt
echo -n "" > $file
for cpu_type in AtomicSimpleCPU TimingSimpleCPU DerivO3CPU
do
	for clk_rate in 1 1.5 2 2.5 3 3.5 4
	do

		build/X86/gem5.opt configs/example/se.py --cmd=lab/prime3 --cpu-type=$cpu_type --sys-clock="$clk_rate"GHz --l1d_size=64kB --l1i_size=16kB --caches
		echo -e "CPU Type:$cpu_type\nClock Rate:$clk_rate"GHz"" >> $file
		echo -n "Sim Seconds:" >> $file
		grep -Po "(?<=sim_seconds).*(?=#)" m5out/stats.txt | sed s/[[:space:]]//g >> $file
		echo -n "Sim Ticks:" >> $file
		grep -Po "(?<=sim_ticks).*(?=#)" m5out/stats.txt | sed s/[[:space:]]//g >> $file
		echo "" >> $file	

	done
done