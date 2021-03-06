# YCUT
This bash script downloads a portion of a video from youtube. 
Relies on [youtube-dl](https://github.com/ytdl-org/youtube-dl.git) and [ffmpeg](https://ffmpeg.org/).

## USAGE

	ycut.sh link_of_video -t hh:mm:ss-hh:mm:ss -f fileformat

## INPUT

* The link of the video (MANDATORY)
* The portion of the video to trim with start and end times (OPTIONAL)
* The output format (i.e. mp3, mpeg, mp4, flv ...) for the clip (OPTIONAL)

## OUTPUT
A file *_cut.fmt* is created, where fmt is the format if it has been specified; otherwise the default mp4 is used.
In case no trimming is specified, a file *_out.mp4* containing the whole video is created.

## INSTALLATION
Simply copy the script to a directory present in the system path. Alternatively, run:
```bash
make install
```
