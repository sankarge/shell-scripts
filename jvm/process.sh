dir=$1
for (( i=1;i<230;i++))
 do 
	histo=$dir/jmap_histo$i.log
	gc=$dir/jstat_gc$i.log
	echo log-$i	

	tot=`cat $histo | wc -l`
	gen_count=`grep "sun.reflect.Generated" $histo | wc -l`
	others_count=`grep -v "sun.reflect.Generated" $histo | wc -l`

	echo "total:     " $tot
	echo "generated: " $gen_count
	echo "others:    " $others_count

	cat $gc;
	echo "--------";
 done
