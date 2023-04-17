#!/bin/bash

file=/home/ead/yihui/Downloads/gem5/lab4/lab4/comparison.txt
stat=/home/ead/yihui/Downloads/gem5/m5out/stats.txt

echo -n "" > $file
build/X86/gem5.opt configs/example/se.py --cpu-type=TimingSimpleCPU --cmd=/home/ead/yihui/Downloads/gem5/lab4/lab4/stringsearch/search_small_0 --options=" > /home/ead/yihui/Downloads/gem5/lab4/lab4/stringsearch/output_small.txt"
echo -e "Optimazation: 0\nSetup: Default" >> $file
echo -n "Sim Seconds:" >> $file
grep -Po "(?<=sim_seconds).*(?=#)" $stat | sed s/[[:space:]]//g >> $file
echo -n "Sim Ticks:" >> $file
grep -Po "(?<=sim_ticks).*(?=#)" $stat | sed s/[[:space:]]//g >> $file
echo "" >> $file	


build/X86/gem5.opt configs/example/se.py --cmd=/home/ead/yihui/Downloads/gem5/lab4/lab4/stringsearch/search_small_0 --cpu-type=TimingSimpleCPU --l1d_size=4kB --cacheline_size=256 --l1d_assoc=16 --caches --options=" > /home/ead/yihui/Downloads/gem5/lab4/lab4/stringsearch/output_small.txt"
echo -e "Optimazation: 0\nSetup: Optimum" >> $file
echo -n "Sim Seconds:" >> $file
grep -Po "(?<=sim_seconds).*(?=#)" $stat | sed s/[[:space:]]//g >> $file
echo -n "Sim Ticks:" >> $file
grep -Po "(?<=sim_ticks).*(?=#)" $stat | sed s/[[:space:]]//g >> $file
echo "" >> $file


build/X86/gem5.opt configs/example/se.py --cpu-type=TimingSimpleCPU --cmd=/home/ead/yihui/Downloads/gem5/lab4/lab4/stringsearch/search_small_3 --options=" > /home/ead/yihui/Downloads/gem5/lab4/lab4/stringsearch/output_small.txt"
echo -e "Optimazation: 3\nSetup: Default" >> $file
echo -n "Sim Seconds:" >> $file
grep -Po "(?<=sim_seconds).*(?=#)" $stat | sed s/[[:space:]]//g >> $file
echo -n "Sim Ticks:" >> $file
grep -Po "(?<=sim_ticks).*(?=#)" $stat | sed s/[[:space:]]//g >> $file
echo "" >> $file	


build/X86/gem5.opt configs/example/se.py --cmd=/home/ead/yihui/Downloads/gem5/lab4/lab4/stringsearch/search_small_3 --cpu-type=TimingSimpleCPU --l1d_size=4kB --cacheline_size=256 --l1d_assoc=16 --caches --options=" > /home/ead/yihui/Downloads/gem5/lab4/lab4/stringsearch/output_small.txt"
echo -e "Optimazation: 3\nSetup: Optimum" >> $file
echo -n "Sim Seconds:" >> $file
grep -Po "(?<=sim_seconds).*(?=#)" $stat | sed s/[[:space:]]//g >> $file
echo -n "Sim Ticks:" >> $file
grep -Po "(?<=sim_ticks).*(?=#)" $stat | sed s/[[:space:]]//g >> $file
echo "" >> $file