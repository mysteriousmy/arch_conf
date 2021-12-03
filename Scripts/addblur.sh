#!/bin/bash


a=$(cat /home/jack/.config/compton.conf | grep blur-strength | awk '{print $3}')
b=`expr $a + 1`
#echo $a
echo $b
sed -i "s/blur-strength = $a/blur-strength = $b/" /home/jack/.config/compton.conf

