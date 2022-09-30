#!/usr/bin/env python3

import psutil
import os
import time

while True:
    battery = psutil.sensors_battery()
    if battery.percent < 20:
        stream = os.popen(f'notify-send "{battery.percent}"')
    time.sleep(5)
