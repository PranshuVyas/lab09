#!/bin/bash

for pin in 0 1 2 3 
do 
        gpio write $pin $((($1>>$pin) & 1))
done


