#!/bin/bash
file=lab2/1-b.txt
blk_s=32
echo -n "" > $file
for app in cc1.din spice.din tex.din
do
	for cc_s in 4 8 16
	do
		fully=`expr $cc_s \* 1000 / 32`			
		for ass_s in 1 2 4 8 $fully 
		do
			/home/ead/yihui/Downloads/dineroIV-master/d4-7/dineroIV -l1-usize $cc_s'k' -l1-ubsize 32 -l1-uassoc $ass_s -informat d <$app> tempresult.txt
			echo -e "Trace:$app\nCache size:$cc_s"KB"\nAssociativity: $ass_s" >> $file
			echo -n "Miss rate:" >> $file
			grep -n "Demand miss rate" tempresult.txt | awk -F"      " '{print $2}' >> $file
			echo "" >> $file	
		done
	done
done		 
		
