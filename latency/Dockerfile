FROM ubuntu

MAINTAINER Ziye Han (zhan12@ucsc.edu)

# update apt-get
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y build-essential

# install basic linux tools
RUN apt-get install -y wget
RUN apt-get install -y unzip
RUN apt-get install -y software-properties-common python-software-properties

# install python2.7 (later used to run systrace.py)
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt-get install -y python2.7

# install adb tools for android monkey test
RUN add-apt-repository ppa:nilarimogard/webupd8 -y
RUN apt-get install -y android-tools-adb android-tools-fastboot

# install sdk for android monkey test
RUN add-apt-repository ppa:upubuntu-com/sdk -y
RUN apt-get install -y android-sdk

# install other adb tools
RUN wget http://dl.google.com/android/android-sdk_r24.2-linux.tgz
RUN tar -xvf android-sdk_r24.2-linux.tgz
RUN cd android-sdk-linux/tools
RUN ./android update sdk --no-ui 

# add yourself to the plug dev mode, then you can use adb
RUN usermod -aG plugdev $(id -u -n)

# download vanilla apk (I have uploaded the apk to my github)
RUN wget https://github.com/ZiyeHan/CMPS-202/raw/master/latency/VanillaMusic.apk






