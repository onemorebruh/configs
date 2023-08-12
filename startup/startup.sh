!#/bin/bash

exec numlockx
exec ./battery_level_alert.py
exec notify "battety_level_alert enabled"
