#!/bin/bash

#"Ted"'s guide suggests following startup params
$(`/usr/bin/jackd -d alsa --device hw:1 --rate 44100 --period 128`);
$(`fluidsynth --server --audio-driver=jack --conneAct-jack-outputs /usr/share/sounds/sf2/FluidR3_GM.sf2`);
DEVICE_LIST=`aplay -l`
PORT_LIST=`aplaymidi -l`
echo "$DEVICE_LIST"
echo "$PORT_LIST"

