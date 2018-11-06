#!/bin/sh

echo "Please enter the start number: "
read startnum

echo "Please enter the final number: "
read lastnum
echo "Number of times you want to repeat: "
read n
echo "Enter any text you want to display at the beginning: "
read text
echo "#############################################"

for (( i=startnum ; ((i-(lastnum + 1))) ; i=(($i+1)) )) 
do
  seq -f "$text$i" $n
done;

