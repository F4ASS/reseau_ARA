#!/bin/sh
mv restart.* /etc/spotnik/
chmod +x /etc/spotnik/restart.*
mv modede*.* /etc/spotnik/
chmod +x /etc/spotnik/modedeffrm.py
chmod +x /etc/spotnik/modedef.py
mv *.wav /usr/share/svxlink/sounds/fr_FR/RRF/
cp /usr/share/svxlink/events.d/local/Logic.tcl /usr/share/svxlink/events.d/local/Logic.tcl.old
mv Logic.tcl /usr/share/svxlink/events.d/local/
