#!/bin/bash

mkdir PlotFiles
mkdir ImageFiles

# close nmi_watchdog
echo 0 | dd of="/proc/sys/kernel/nmi_watchdog"

pip install matplotlib==1.5.3
pip install brewer2mpl

apt-get install -y vim
apt-get install -y python-tk

echo "Now you need to manualy vim change /usr/local/lib/python2.7/dist-packages/matplotlib/mpl-data/matplotlibrc."
echo "Edit backend : Agg. You have 30 seconds."
sleep 30s

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

# generate CPI text
for i in 1 2 4 8 # number of threads
	do
		for j in 800 200 50 12 3 # number fo size
			do
				perf stat -d -o ./result$i$j MultithreadJackson.jar $i 1 $j input.txt
			done
	done

python generateCSV.py 
python generatePLOT.py 


echo "All images are in the ImageFiles/ directory."









