FROM ubuntu:17.10

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

# install adb tools for android monkey test
RUN add-apt-repository ppa:nilarimogard/webupd8
RUN apt-get install -y android-tools-adb android-tools-fastboot

# install sdk for android monkey test
RUN add-apt-repository ppa:upubuntu-com/sdk
RUN apt-get install -y android-sdk

# add yourself to the plug dev mode, then you can use adb
RUN usermod -aG plugdev $(id -u -n)

# download vanilla apk (I have upload apk to my github)
RUN wget https://github.com/ZiyeHan/CMPS-202/raw/master/latency/VanillaMusic.apk

# important !!!
# then you need to manualy connect your divice to the machine, there is no way to do it in cmd. Manualy do it please...

# install the apk to your device
RUN adb install VanillaMusic.apk

# start systrace monitor for 30 seconds, monitor latency like frames


# start monkey runner for hand-free aumotation testing


# collect systrace visualization latency report in HTML web page





