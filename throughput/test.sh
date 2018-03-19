#!/bin/bash

mkdir PlotFiles
mkdir ImageFiles

# close nmi_watchdog
echo 0 | sudo dd of ="/proc/sys/kernel/nmi_watchdog"







