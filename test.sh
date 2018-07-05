
OLD_IFS="$IFS" 
IFS="," 
branch_names=($1) 
IFS="$OLD_IFS" 
for bname in ${branch_names[@]} 
do 
    echo $bname
done