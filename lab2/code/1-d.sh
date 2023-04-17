#!/bin/bash
file=lab2/1-d.txt
blk_s=32
ass_s=4
rplc=l
echo -n "" > $file
for app in cc1.din spice.din tex.din
do
          	/home/ead/yihui/Downloads/dineroIV-master/d4-7/dineroIV -l1-usize 32'k' -l1-ubsize $blk_s -l1-uassoc $ass_s -l1-urepl $rplc -informat d <$app> tempresult.txt
                echo -e "Cache type:u\nTrace:$app\nCache size:32"KB"\nBlock size:$blk_s\nAssociativity: $ass_s\nReplacement policy:$rplc" >> $file
                echo -n "Miss rate:" >> $file
                grep -n "Demand miss rate" tempresult.txt | awk -F" " '{print $5}' >> $file
                echo "" >> $file

          	/home/ead/yihui/Downloads/dineroIV-master/d4-7/dineroIV -l1-isize 16'k' -l1-ibsize $blk_s -l1-iassoc $ass_s -l1-irepl $rplc -informat d <$app> tempresult.txt
                echo -e "Cache type:i\nTrace:$app\nCache size:16"KB"\nBlock size:$blk_s\nAssociativity: $ass_s\nReplacement policy:$rplc" >> $file
                echo -n "Miss rate:" >> $file
                grep -n "Demand miss rate" tempresult.txt | awk -F" " '{print $5}' >> $file
                echo "" >> $file

          	/home/ead/yihui/Downloads/dineroIV-master/d4-7/dineroIV -l1-dsize 16'k' -l1-dbsize $blk_s -l1-dassoc $ass_s -l1-drepl $rplc -informat d <$app> tempresult.txt
                echo -e "Cache type:d\nTrace:$app\nCache size:16"KB"\nBlock size:$blk_s\nAssociativity: $ass_s\nReplacement policy:$rplc" >> $file
                echo -n "Miss rate:" >> $file
                grep -n "Demand miss rate" tempresult.txt | awk -F" " '{print $5}' >> $file
                echo "" >> $file
	
done		 
		
