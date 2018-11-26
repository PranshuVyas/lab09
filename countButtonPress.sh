#!/bin/bash
#Pin 0 RED 1 GREEN 2 YELLOW 3 BLUE


gpio mode 5 in #Sets pin 5 (button as the input)
gpio mode 5  up # Sets pin 5 to pull up resisitor
value=$(gpio read 5)


#Sets the value of pin 0-4 value
for pin  in {0..4}
do
  gpio mode $pin out
done
count=0 

while true
do
value=$(gpio read 5)
#./waitForButtonPress.sh

if [ $value -eq 0 ]
then
  count=$(($count+ 1))
  ./setbits.sh "$count"
fi  

if [ $count -eq 16 ]
then
count=0
  gpio write 4 1
  sleep 1
  gpio write 4 0
  echo "You reached End"		
fi 
sleep 0.5
done
