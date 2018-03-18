FROM ubuntu:17.10

MAINTAINER Ziye Han

# update apt-get
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y build-essential

# install basic linux tools
RUN apt-get install -y git
RUN apt-get install -y unzip
RUN apt-get install -y wget

# install perf
RUN apt-get install -y linux-tools-common
RUN apt-get install -y linux-tools-4.13.0-36-generic
RUN apt-get install -y linux-cloud-tools-4.13.0-36-generic

# install python2.7 (later used to run systrace.py)
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update
RUN apt-get install -y python2.7
RUN pip install matplotlib

# install java jdk
RUN add-apt-repository ppa:webupd8team/java
RUN apt update; apt install -y oracle-java8-installer
RUN apt install -y oracle-java8-set-default

# install pmu-tools
RUN git clone https://github.com/andikleen/pmu-tools
WORKDIR pmu-tools
RUN export PATH=$PATH:`pwd`

# download my jar
RUN wget https://github.com/ZiyeHan/CMPS-202/raw/master/throughput/MultithreadJackson.jar

# download my input set
RUN wget https://raw.githubusercontent.com/ZiyeHan/CMPS-202/master/throughput/input.txt

# change work directory
WORKDIR pmu-tools

# downlaod my shells scripts for generating CSV
RUN wget https://raw.githubusercontent.com/ZiyeHan/CMPS-202/master/throughput/generateCSV.sh
RUN ./generateCSV.sh

# download my shells scripts for generating PNG image from CSVs
RUN wget https://raw.githubusercontent.com/ZiyeHan/CMPS-202/master/throughput/generatePNG.sh  
RUN ./generatePNG.sh



