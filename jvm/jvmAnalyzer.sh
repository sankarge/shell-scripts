#Periodically requests jvm debug commands and dumps the logs files
#usage jvmAnalyzer.sh [daemonName] [pid]
#ex: /tmp/jvmlogs/script/jvmAnalyzer.sh epi 26627 > /tmp/jvmlogs/logs/jvmAnalyzer.log &

rootDir=/opt/na/debug/jvmlogs
mkdir -p $rootDir

dir=$rootDir/$1
echo "creating $dir .."
mkdir -p $dir

pid=$2
i=1
sleepTimeInSecs=300 #5 mins

while true
 do
	
	echo `date +%Y-%m-%d:%H:%M:%S`
	echo "Iteration no: $i"
	echo "jstat -gc .."
	jstat -gc $pid > $dir/jstat_gc$i.log

        echo "jstat -class .."
        jstat -class $pid > $dir/jstat_class$i.log

	echo "jmap -histo .."
	jmap -histo $pid > $dir/jmap_histo$i.log

	i=`expr $i + 1`
	sleep $sleepTimeInSecs 
 done
