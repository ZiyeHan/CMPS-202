#!/bin/bash

mkdir PlotFiles
mkdir ImageFiles

# close nmi_watchdog
echo 0 | dd of="/proc/sys/kernel/nmi_watchdog"

wget https://pypi.python.org/packages/33/da/6409d32c46778ed20308e83bc501ff2ff8a9cbda5dd7b26362c5e99a6149/matplotlib-2.2.2-cp27-cp27mu-manylinux1_x86_64.whl#md5=2d6201316e11f9b425bda8fe366d4e23
pip install matplotlib-2.2.2-cp27-cp27mu-manylinux1_x86_64.whl


# generate csv
for i in 1 2 4 8 # number of threads
	do
		for j in 800 200 50 12 3 # number fo size
			do
				python pmu-tools/toplev.py -l3 -I 1000 -x, -o PlotFiles/CSV$i$j.csv perf stat -d java -jar MultithreadJackson.jar $i 1 $j input.txt
			done
	done


# generate PNG
for i in 1 2 4 8 # number of threads 
	do
        for j in 800 200 50 12 3 # number fo size 
        	do
        		python pmu-tools/tl-barplot.py --cpu C0-T0 PlotFiles/CSV$i$j.csv -o ImageFiles/image$i$j.png
        	done
	done








