FROM ubuntu

MAINTAINER Ziye Han (zhan12@ucsc.edu)

# update apt-get
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y build-essential

# install basic linux tools
RUN apt-get install -y git
RUN apt-get install -y unzip
RUN apt-get install -y wget
RUN apt-get install -y software-properties-common python-software-properties

# install perf
RUN apt-get install -y linux-tools-common
RUN apt-get install -y linux-tools-4.13.0-36-generic
RUN apt-get install -y linux-cloud-tools-4.13.0-36-generic
RUN apt-get install -y linux-tools-4.4.0-1050-aws
RUN apt-get install -y linux-cloud-tools-4.4.0-1050-aws

# install python 3 (later used to run systrace.py)
RUN apt-get install -y python3.6
RUN apt-get install -y python3-pip

# install some python libs
RUN pip3 install matplotlib

# install java jdk
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt install -y oracle-java8-installer
RUN apt install -y oracle-java8-set-default

# install pmu-tools
RUN git clone https://github.com/andikleen/pmu-tools

# download my jar
RUN wget https://github.com/ZiyeHan/CMPS-202/raw/master/throughput/MultithreadJackson.jar

# download my input set
RUN wget https://raw.githubusercontent.com/ZiyeHan/CMPS-202/master/throughput/input.txt


