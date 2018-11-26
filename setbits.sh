#!/bin/bash

in=$1


a=$(($in&1))
b=$((($in>>1)&1))
c=$((($in>>2)&1))
d=$((($in>>3)&1))


gpio write 0 $a
gpio write 1 $b
gpio write 2 $c
gpio write 3 $d

echo $a $b $c $d
