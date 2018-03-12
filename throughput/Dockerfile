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

# install python2.7 (later used to run systrace.py)
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update
RUN apt-get install -y python2.7

# install java jdk
RUN add-apt-repository ppa:webupd8team/java
RUN apt update; sudo apt install oracle-java8-installer
RUN apt install oracle-java8-set-default

# download my jar
RUN wget https://github.com/ZiyeHan/CMPS-202/raw/master/throughput/MultithreadJackson.jar

# download my input set
RUN 

# run 1thread, 2T，then collect result 

# run 2thread, 2T，then collect result

# run 4thread, 2T，then collect result

# run 8thread, 2T，then collect result

# run 8thread, 2T，then collect result

# run 8thread, 2T，then collect result

# run 8thread, 2T，then collect result






