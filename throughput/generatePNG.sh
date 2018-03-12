#!/bin/bash

for i in 1 2 4 8 # number of threads 
	do
        for j in 800 200 50 12 3 # number fo size 
        	do
        		sudo tl-barplot.py --cpu C0-T0 plot/CSV$i$j.csv -o image/image$i$j.png
        	done
	done
exit 0
