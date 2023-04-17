#!/bin/bash
file=lab/3-1-2.txt
echo -n "" > $file
clk_rate=2
for cpu_type in AtomicSimpleCPU TimingSimpleCPU
do
	for mem_type in  DDR3_1600_8x8 DDR3_2133_8x8 LPDDR2_S4_1066_1x32 HBM_1000_4H_1x64
	do

		build/X86/gem5.opt configs/example/se.py --cmd=lab/prime0 --cpu-type=$cpu_type --sys-clock="$clk_rate"GHz --mem-type=$mem_type --l1d_size=64kB --l1i_size=16kB --caches
		echo -e "CPU Type:$cpu_type\nClock Rate:$clk_rate"GHz"\nMem Type:$mem_type">> $file
		echo -n "Sim Seconds:" >> $file
		grep -Po "(?<=sim_seconds).*(?=#)" m5out/stats.txt | sed s/[[:space:]]//g >> $file
		echo -n "Sim Ticks:" >> $file
		grep -Po "(?<=sim_ticks).*(?=#)" m5out/stats.txt | sed s/[[:space:]]//g >> $file
		echo "" >> $file	

	done
done	