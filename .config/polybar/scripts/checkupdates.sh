
updates=`apt list --upgradable | wc -l`
updates=$(( updates - 1 ))

echo $updates