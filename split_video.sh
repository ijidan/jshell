#!/bin/bash

#ffmpeg -acodec copy -vcodec copy -ss 00:00:00 -t 00:02:00 -i $i 1.mp4
#ffmpeg -acodec copy -vcodec copy -ss 00:02:00 -t 00:02:00 -i $i 2.mp4
#ffmpeg -acodec copy -vcodec copy -ss 00:04:00 -t 00:02:00 -i $i 3.mp4
#ffmpeg -acodec copy -vcodec copy -ss 00:06:00 -t 00:02:00 -i $i 4.mp4
#ffmpeg -acodec copy -vcodec copy -ss 00:08:00 -t 00:02:00 -i $i 5.mp4
#ffmpeg -acodec copy -vcodec copy -ss 00:10:00 -t 00:02:00 -i $i 6.mp4
#ffmpeg -acodec copy -vcodec copy -ss 00:12:00 -t 00:02:00 -i $i 7.mp4
#ffmpeg -acodec copy -vcodec copy -ss 00:14:00 -t 00:02:00 -i $i 9.mp4
#ffmpeg -acodec copy -vcodec copy -ss 00:16:00 -t 00:03:00 -i $i 10.mp4




ffmpeg -ss 00:00:00  -i "$1" -vcodec copy -acodec -t 00:02:00 copy 1.mp4
ffmpeg -ss 00:02:00  -i "$1" -vcodec copy -acodec -t 00:02:00 copy 2.mp4
ffmpeg -ss 00:04:00  -i "$1" -vcodec copy -acodec -t 00:02:00 copy 3.mp4
ffmpeg -ss 00:06:00  -i "$1" -vcodec copy -acodec -t 00:02:00 copy 4.mp4
ffmpeg -ss 00:08:00  -i "$1" -vcodec copy -acodec -t 00:02:00 copy 5.mp4
ffmpeg -ss 00:10:00  -i "$1" -vcodec copy -acodec -t 00:02:00 copy 6.mp4
ffmpeg -ss 00:12:00  -i "$1" -vcodec copy -acodec -t 00:02:00 copy 7.mp4
ffmpeg -ss 00:14:00  -i "$1" -vcodec copy -acodec -t 00:02:00 copy 8.mp4
ffmpeg -ss 00:16:00  -i "$1" -vcodec copy -acodec -t 00:03:00 copy 9.mp4




