#!/bin/bash
file=lab2/1-c.txt
blk_s=16
cc_s=8
ass_s=2
echo -n "" > $file
for app in cc1.din spice.din tex.din
do
	for rplc in l f r
	do
		/home/ead/yihui/Downloads/dineroIV-master/d4-7/dineroIV -l1-usize $cc_s'k' -l1-ubsize $blk_s -l1-uassoc $ass_s -l1-urepl $rplc -informat d <$app> tempresult.txt
		echo -e "Trace:$app\nCache size:$cc_s"KB"\nBlock size:$blk_s\nAssociativity: $ass_s\nReplacement policy:$rplc" >> $file
		echo -n "Miss rate:" >> $file
		grep -n "Demand miss rate" tempresult.txt | awk -F"      " '{print $2}' >> $file
		echo "" >> $file
	done
done		 
		
