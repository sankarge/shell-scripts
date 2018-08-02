dir=$1
start=$2
end=$3

echo totalClasses,reflection,alcatel,hibernate,spring.jfreeChart,MC,MU,CCSC,CCSU,FGC
for (( i=$start;i<=$end;i++))
 do 
	histo=$dir/jmap_histo$i.log
	gc=$dir/jstat_gc$i.log

	#counts the classes from jmap -histo logs
	tot=`cat $histo | wc -l`
	reflect_count=`grep "sun.reflect" $histo | wc -l`
	alcatel_count=`grep "com.alcatel" $histo | wc -l`
	hibernate_count=`grep "org.hibernate" $histo | wc -l`
	spring_count=`grep "org.spring" $histo | wc -l`
	jfree_count=`grep "org.jfree" $histo | wc -l`

	#filters MC,MU,CCSC,CCSU,FGC from jstat -gc
	gc_info=`tail -1 $gc | awk '{print $9 "," $10 "," $11 "," $12 "," $15}'`

	#appends both the jmap, jstat info as csv
	echo $tot,$reflect_count,$alcatel_count,$hibernate_count,$spring_count,$jfree_count,$gc_info

 done
