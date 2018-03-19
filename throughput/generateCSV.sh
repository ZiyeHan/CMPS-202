#!/bin/bash

for i in 1 2 4 8 # number of threads
	do
		for j in 800 200 50 12 3 # number fo size
			do
				toplev.py -l3 -I 1000 -x, -o PlotFiles/CSV$i$j.csv perf stat -d java -jar MultithreadJackson.jar $i 1 $j input.txt
			done
	done

exit 0


