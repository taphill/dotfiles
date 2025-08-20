#!/bin/bash

yt-dlp \
--extractor-args "youtube:player-client=web" \
--cookies-from-browser chrome \
--no-keep-video \
--extract-audio \
--audio-format wav \
--audio-quality 0 \
--output $1 \
--paths $HOME/samples \
$2
