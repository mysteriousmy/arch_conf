#!/bin/bash
ps -ef | grep $1 | awk 'NR>1{print line}{line=$2}' | xargs kill -9
