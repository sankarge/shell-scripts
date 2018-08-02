threshold=$1

echo "$(date '+%Y-%m-%d %H:%M:%S'): Running free memory monitor with threshold $threshold%.."

while(true)

do
  freePercent=`free -m | grep Mem: | awk '{print ($7/$2)*100}'`

  if (( $(awk 'BEGIN {print ("'$freePercent'" < "'$threshold'")}') ))
  then
       echo "$(date '+%Y-%m-%d %H:%M:%S'): Free memory $freePercent% is less than $threshold%"
       free -m
       docker stats --no-stream
       sleep 60	 
       echo ""	
  else
       echo "$(date '+%Y-%m-%d %H:%M:%S'): Sufficient free memory available: $freePercent%"
  fi
  sleep 30

done

