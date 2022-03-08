#!/bin/bash
num1=$(free -m | awk '{print $3}' | sed -n "3p")
num2=$(free -m | awk '{print $2}' | sed -n '3p')
#echo $num1
#echo $num2
num3=$(awk 'BEGIN{printf("%.2f",'$num1' / '$num2')}')
num4=$(awk 'BEGIN{printf("%d",'$num3' * 100)}')
echo $num4
