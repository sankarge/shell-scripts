root=/udir/$USER/git/$1;
cd $root
echo "updating root.."
git pull

echo "updating slaves.."
for f in `awk '!/puppet/{print $2}' .gitslave | sed -e 's/"//g'`
   do 
	echo "Updating "$f; 
	cd $f; 
	git pull;
	cd $root;
   done

