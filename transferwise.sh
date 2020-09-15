# Command usage:   transferwise.sh <TARGET-PRICE> <SLEEP_TIME_SECS>
# Ex: transferwise.sh 85 60

echo "____________________________________________"
echo "| Time                | Current  |  Target | "
echo "--------------------------------------------"

target=$1

while(true)
    do 

        tim=`date +%Y-%m-%d:%H:%M:%S`; 
	#currentPrice=`curl -s https://transferwise.com/gb/currency-converter/eur-to-inr-rate?amount=1 | grep 'text-success' | head -1 | cut -d '>' -f 2 | sed -e 's/<\/span//'`;
	currentPrice=`curl -s https://transferwise.com/gb/currency-converter/eur-to-inr-rate?amount=1 | grep 'span class="text-success"'| head -1 | cut -d '>' -f 2 |  sed -e 's/<\/span//'`
        
	echo "|"  $tim "|" $currentPrice "|" $target "  |"
        echo "--------------------------------------------"

        isTargetReached=`echo "$currentPrice > $target " | bc -l`

        if (( $isTargetReached ))
            then say Target reached for $target;
            target=`echo "$target + 0.10" | bc -l`
        fi
       sleep $2; 
    done
