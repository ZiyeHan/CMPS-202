echo "important !!!"
echo "Now you need to manualy connect your android divice to the machine. You have 30 seconds."
sleep 30s

# install the apk to your device
adb install VanillaMusic.apk
sleep 5s
# start systrace monitor for 200*500/1000=100 seconds, monitor latency like frames
cd ./android-sdk-linux/platform-tools/systrace

echo "Wait for First Run..."
# start monkey runner for hand-free aumotation testing
# send 200 random actions to the app, interval is 500ms between events
adb shell monkey -p ch.blinkenlights.android.vanilla -v --throttle 300 500
# Cool! Monkeyrunner start working!
python systrace.py --time=50 -o latencyResult1.html


echo "Wait for Second Run..."
sleep 10s
# start monkey runner for hand-free aumotation testing
# send 200 random actions to the app, interval is 500ms between events
adb shell monkey -p ch.blinkenlights.android.vanilla -v --throttle 300 500
# Cool! Monkeyrunner start working!
python systrace.py --time=50 -o latencyResult2.html


echo "Wait for Third Run..."
sleep 10s
# start monkey runner for hand-free aumotation testing
# send 200 random actions to the app, interval is 500ms between events
adb shell monkey -p ch.blinkenlights.android.vanilla -v --throttle 300 500
# Cool! Monkeyrunner start working!
python systrace.py --time=50 -o latencyResult3.html


echo "Wait for Fourth Run..."
sleep 10s
# start monkey runner for hand-free aumotation testing
# send 200 random actions to the app, interval is 500ms between events
adb shell monkey -p ch.blinkenlights.android.vanilla -v --throttle 300 500
# Cool! Monkeyrunner start working!
python systrace.py --time=50 -o latencyResult4.html


# collect systrace visualization latency report in HTML web page



