#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# Script FG8OJ pour Spotnik
# Relance après inactivité radio vers un groupe par défault
# Cron :
# * * * * * python /etc/spotnik/modedef.py > /dev/null 2>&1
# Configuration :
default="ara" # appel du fichier restart /etc/spotnik/restart.xxx
timeout=30 # durée en minute avant le rebasculement sur le salon par défault
#
#
import datetime
import os
log = open("/etc/spotnik/network","rt")
reseau=log.readline().strip()
if (reseau == default):
 exit()
log2 = open("/tmp/svxlink.log", "rt")
delay=9999999
for x in log2:
 if ( (x.find("The squelch is OPEN")>-1)or(x.find("Activating link")>-1) ):
  dti=x.find(": ")
  dt=x[:dti]
  dt= datetime.datetime.strptime(dt,"%a %b %d %H:%M:%S %Y")
  dt=datetime.datetime.now() - dt
  if (delay>dt.total_seconds()):
   delay=int(dt.total_seconds())
print(delay)
if (delay==9999999):
 exit()
if (delay>(timeout*60)):
 print("restart "+ str(delay))
 os.system("/etc/spotnik/restart." + str(default)) 
log.close()
