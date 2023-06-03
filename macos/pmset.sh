#!/bin/bash

sudo pmset -a gpuswitch 2

# Battery Power

sudo pmset -b lidwake 0
sudo pmset -b standbydelayhigh 900
sudo pmset -b standbydelaylow 300
sudo pmset -b standby 1
sudo pmset -b proximitywake 1
sudo pmset -b ttyskeepawake 1
sudo pmset -b highstandbythreshold 40
sudo pmset -b powernap 0
sudo pmset -b hibernatemode 3
sudo pmset -b displaysleep 1
sudo pmset -b sleep 10
sudo pmset -b tcpkeepalive 1
sudo pmset -b halfdim 1
sudo pmset -b acwake 0
sudo pmset -b lessbright 1
sudo pmset -b disksleep 15
sudo pmset -b womp 0
sudo pmset -b autorestart 0

# AC Adapter
sudo pmset -c lidwake 0
sudo pmset -c standbydelayhigh 3600
sudo pmset -c standbydelaylow 1800
sudo pmset -c standby 1
sudo pmset -c proximitywake 1
sudo pmset -c ttyskeepawake 1
sudo pmset -c hibernatemode 3
sudo pmset -c powernap 0
sudo pmset -c highstandbythreshold 40
sudo pmset -c womp 1
sudo pmset -c displaysleep 10
sudo pmset -c sleep 30
sudo pmset -c tcpkeepalive 1
sudo pmset -c halfdim 0
sudo pmset -c acwake 0
sudo pmset -c disksleep 15
sudo pmset -c autorestart 0
