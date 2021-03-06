source ./calc_env.sh


>$final_all

while read line || [ -n "$line" ]
do
  nm=`echo $line | awk '{print $1}' | tr A-Z a-z`
  grf=`echo $line | awk '{print $2}' | cut -f1 -d"."`
  grm=`cat $midterms_dst | grep $nm | awk '{print $2}' | cut -f1 -d"."`
  name=`cat $map | grep $nm | awk '{print $3}'`
  #echo $name $nm
  grh=`cat $homeworks_dst | grep $name | awk '{print $2}'`
 
  grf_=`echo "scale=2; $grf / 2" | bc`
  grf_r=`printf '%.*f\n' 0 $grf_`

  grm_=`echo "scale=2; $grm / 4" | bc`
  grm_r=`printf '%.*f\n' 0 $grm_`

  grh_=`echo "scale=2; $grh / 4" | bc`
  grh_r=`printf '%.*f\n' 0 $grh_`

  sum=$(( $grf_r + $grm_r + $grh_r ))
  echo "$nm $sum" >> $final_all
done < $final_dst


