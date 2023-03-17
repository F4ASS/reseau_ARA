#!/bin/sh
mv restart.* /etc/spotnik/
mv modede*.* /etc/spotnik/
chmod +x modedeffrm.py
chmod +x modedef.py
mv *.wav /usr/share/svxlink/sounds/fr_FR/RRF/
cp /usr/share/svxlink/events.d/local/Logic.tcl /usr/share/svxlink/events.d/local/Logic.tcl.old
mv Logic.tcl /usr/share/svxlink/events.d/local/
