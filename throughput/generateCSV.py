import re
import csv
import sys

newFileName = 'res'

for i in [1,2,4,8]:
   for j in [80,200,50,12,3]:
	filename = 'result' + str(i) + str(j) 
	pattern  = '\s*(.*?)\s*(instructions|cycles|branches|branch-misses|L1-dcache-loads|L1-dcache-load-misses|LLC-loads|LLC-load-misses)'                   
	new_file = []

	with open(filename, 'r') as f:
	   lines = f.readlines()

	for line in lines:
	    match = re.search(pattern, line)
	    if match:
		new_line = match.group(1)
		new_file.append(new_line)

	paraNoComma = []
	for num in new_file:
		paraNoComma.append(num.replace(",",""))

	with open(newFileName, 'a') as f:   
	     	f.write(str(i) + " " + str(j) + " " + paraNoComma[0] + " ")
	     	f.write(paraNoComma[1] + " ")
	     	f.write(paraNoComma[2] + " ")
	     	f.write(paraNoComma[3] + " ")
	     	f.write(paraNoComma[4] + " ")
	     	f.write(paraNoComma[5] + " ")
	     	f.write(paraNoComma[6] + " ")
	     	f.write(paraNoComma[7] + "\n")

txt_file = r"res"
csv_file = r"mycsv.csv"
in_txt = csv.reader(open(txt_file, "rb"), delimiter = ' ')
out_csv = csv.writer(open(csv_file, 'wb'))
out_csv.writerows(in_txt)

