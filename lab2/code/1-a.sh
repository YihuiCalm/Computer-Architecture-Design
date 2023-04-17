#!/bin/bash
for app in cc1.din spice.din tex.din
do
	for cc_s in 1k 4k 8k
	do
		for blk_s in 16 32 64 128
		do
			/home/ead/yihui/Downloads/dineroIV-master/d4-7/dineroIV -l1-usize $cc_s -l1-ubsize $blk_s -l1-uassoc 1 -informat d <$app> tempresult.txt
			echo -e "Trace:$app\nCache size:$cc_s\nBlock size: $blk_s" >> lab2/1-a.txt
			echo -n "Miss rate:" >> lab2/1-a.txt
			grep -n "Demand miss rate" tempresult.txt | awk -F"      " '{print $2}' >> lab2/1-a.txt
			echo "" >> lab2/1-a.txt	
		done
	done
done		 
		
