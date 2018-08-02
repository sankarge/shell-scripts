#Periodically requests dumps the clstats & hprof files
#CAUTION: Executing this script will hold jvm for a while and hence affects application performance

rootDir=/opt/na/debug/jvmlogs
mkdir -p $rootDir

dir=$rootDir/$1
echo "creating $dir .."
mkdir -p $dir

pid=$2
i=1
sleepTimeInSecs=3600 #1 hour

while true
 do
	
	echo `date +%Y-%m-%d:%H:%M:%S`
	echo "Iteration no: $i"

        echo "jmap -clstats .."
	jmap -clstats $pid > $dir/jmap_clstats$i.log

        echo "jmap -dump .."
	jmap -dump:live,format=b,file=$dir/jmap_dump$i.hprof $pid

	i=`expr $i + 1`
	sleep $sleepTimeInSecs 
 done
