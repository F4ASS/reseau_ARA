#!/bin/bash
# DTMF 878 tst #
# stop numeric modes 
/etc/spotnik/num.sh stop
pkill -f svxbridge.py


# Stop svxlink
if pgrep -x svxlink >/dev/null
then
    pkill -TERM svxlink
    pkill -f timersalon
fi

# stop vncserver
if pgrep -x Xtightvnc >/dev/null
then
    pkill -TERM vncserver:1
fi


# Save network
echo "tst" > /etc/spotnik/network

# gestion des annonces vocales 
rm /usr/share/svxlink/sounds/fr_FR/PropagationMonitor/name.wav
ln -s /usr/share/svxlink/sounds/fr_FR/RRF/Stst.wav /usr/share/svxlink/sounds/fr_FR/PropagationMonitor/name.wav

# creation du svxlink.ara
rm -f /etc/spotnik/svxlink.tst
sleep 1
cat /etc/spotnik/svxlink.cfg >/etc/spotnik/svxlink.tst
# coipe du host pour le reflector
echo "HOST=ara-r.fr" >>/etc/spotnik/svxlink.tst
echo "AUTH_KEY=YKGyeyp4" >>/etc/spotnik/svxlink.tst
echo "PORT=5330" >>/etc/spotnik/svxlink.tst

sleep 1

# Clear logs
> /tmp/svxlink.log

# Launch svxlink
svxlink --daemon --logfile=/tmp/svxlink.log --pidfile=/var/run/svxlink.pid --runasuser=root --config=/etc/spotnik/svxlink.tst
sleep 1

# Enable propagation monitor module
echo "10#" > /tmp/dtmf_uhf
echo "10#" > /tmp/dtmf_vhf
