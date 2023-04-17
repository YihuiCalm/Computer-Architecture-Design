#!/bin/bash
file=lab2/1-f.txt
mmm_rate=1
mmm_cc_s=0
mmm_blk_s=0
mmm_ass_s=0
mmm_rplc=0
mmm_cc_type=0

echo -n "" > $file
for app in cc1.din spice.din tex.din
do
	for cc_s in 1 4 8
	do
		for blk_s in 16 32 64 128
		do
          		fully=`expr $cc_s \* 1024 / $blk_s`
        	        for ass_s in 1 2 4 8 $fully
	                do
				for rplc in l f r
				do
					for cc_type in u i d
					do
						/home/ead/yihui/Downloads/dineroIV-master/d4-7/dineroIV -l1-$cc_type'size' $cc_s'k' -l1-$cc_type'bsize' $blk_s -l1-$cc_type'assoc' $ass_s -l1-$cc_type'repl' $rplc -informat d <$app> tempresult.txt
						echo -e "Trace:$app\nCache type:$cc_type\nCache size:$cc_s"KB"\nBlock size:$blk_s\nAssociativity: $ass_s\nReplacement policy:$rplc"
						echo -n "Miss rate:"
						temp_rate="$(grep -n "Demand miss rate" tempresult.txt | awk -F" " '{print $5}')"
						echo -e "$temp_rate\n"
						if [ `echo "$temp_rate < $mmm_rate"|bc` -eq 1 ]
						then
						mmm_rate=$temp_rate
						mmm_cc_s=$cc_s
						mmm_blk_s=$blk_s
						mmm_ass_s=$ass_s
						mmm_rplc=$rplc
						mmm_cc_type=$cc_type
						fi
					done
				done
			done
		done
	done
echo -e "Trace:$app\nOptimal Cache type:$mmm_cc_type\nOptimal Cache size:$mmm_cc_s'KB'\nOptimal Block size:$mmm_blk_s\nOptimal Associativity:$mmm_ass_s\nOptimal Replacement policy:$mmm_rplc\nOptimal Miss rate:$mmm_rate" >> $file
done
