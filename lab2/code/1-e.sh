#!/bin/bash
file=lab2/1-e.txt
blk_s=64
ass_s=1
rplc=l
echo -n "" > $file
for app in cc1.din spice.din tex.din
do
          	/home/ead/yihui/Downloads/dineroIV-master/d4-7/dineroIV -l1-usize 16'k' -l1-ubsize $blk_s -l1-uassoc $ass_s -l1-urepl $rplc -l1-uwback a -informat d <$app> tempresult.txt
                echo -e "Cache type:u\nTrace:$app\nCache size:16"KB"\nBlock size:$blk_s\nAssociativity: $ass_s\nReplacement policy:$rplc\nWrite policy:write back" >> $file
                echo -n "Miss rate:" >> $file
                grep -n "Demand miss rate" tempresult.txt | awk -F" " '{print $5}' >> $file
                echo "" >> $file

          	/home/ead/yihui/Downloads/dineroIV-master/d4-7/dineroIV -l1-usize 16'k' -l1-ubsize $blk_s -l1-uassoc $ass_s -l1-urepl $rplc -l1-uwback n -informat d <$app> tempresult.txt
                echo -e "Cache type:u\nTrace:$app\nCache size:16"KB"\nBlock size:$blk_s\nAssociativity: $ass_s\nReplacement policy:$rplc\nWrite policy:write through" >> $file
                echo -n "Miss rate:" >> $file
                grep -n "Demand miss rate" tempresult.txt | awk -F" " '{print $5}' >> $file
                echo "" >> $file
	
done		 
		
