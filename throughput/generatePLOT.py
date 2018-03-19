import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import csv

x = [3,12,50,200,800]
y11 = []
y12 = []
y13 = []
y14 = []

y21 = []
y22 = []
y23 = []
y24 = []

y31 = []
y32 = []
y33 = []
y34 = []

with open('main.csv','r') as csvfile:

    plots = csv.reader(csvfile, delimiter=',')
    plots = list(plots)
    for i in range(0, len(plots)):
	    if(i < 5):
            y11.append( float(plots[i][5]) / float(plots[i][4]) )
           	y21.append( float(plots[i][7]) / float(plots[i][6]) )
            y31.append( float(plots[i][3]) / float(plots[i][2]) )
	    elif(i < 10):
            y12.append( float(plots[i][5]) / float(plots[i][4]) )
           	y22.append( float(plots[i][7]) / float(plots[i][6]) )
            y32.append( float(plots[i][3]) / float(plots[i][2]) )
	    elif(i < 15):
            y13.append( float(plots[i][5]) / float(plots[i][4]) )
           	y23.append( float(plots[i][7]) / float(plots[i][6]) )
            y33.append( float(plots[i][3]) / float(plots[i][2]) )
	    else: 
            y14.append( float(plots[i][5]) / float(plots[i][4]) )
           	y24.append( float(plots[i][7]) / float(plots[i][6]) )
            y34.append( float(plots[i][3]) / float(plots[i][2]) )

    fig = plt.figure()
    plt.plot(x, y11, label='1 Thread')
    plt.plot(x, y12, label='2 Thread')
    plt.plot(x, y13, label='4 Thread')
    plt.plot(x, y14, label='8 Thread')

    plt.xlabel('instruction scale')
    plt.ylabel('bMPKI')
    plt.title("Compositive branch MPKI graph")
    plt.legend()
    fig.savefig('BRANCH MPKI.png', dpi=fig.dpi)

    fig = plt.figure()
    plt.plot(x, y21, label='1 Thread')
    plt.plot(x, y22, label='2 Thread')
    plt.plot(x, y23, label='4 Thread')
    plt.plot(x, y24, label='8 Thread')

    plt.xlabel('instruction scale')
    plt.ylabel('Load Misses Ratio')
    plt.title("Compositive Load Misses Ratio")
    plt.legend()
    fig.savefig('LOAD MISS RATIO OF L1.png', dpi=fig.dpi)

    fig = plt.figure()
    plt.plot(x, y31, label='1 Thread')
    plt.plot(x, y32, label='2 Thread')
    plt.plot(x, y33, label='4 Thread')
    plt.plot(x, y34, label='8 Thread')

    plt.xlabel('instruction scale')
    plt.ylabel('IPC')
    plt.title("Compositive IPC plot")
    plt.legend()
    fig.savefig('IPC.png', dpi=fig.dpi)

