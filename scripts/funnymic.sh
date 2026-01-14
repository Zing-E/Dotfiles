#!/bin/bash
while true; do
    wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 0
    wpctl set-volume -l 6.0 @DEFAULT_AUDIO_SOURCE@ 6.0
    sleep 0.05
done
