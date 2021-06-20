# YCUT
	This bash script downloads a video from youtube with the
	provided link, or, if -t flag is specified, only the time
	portion specified is saved

## USAGE
	```
    ycut.sh link_of_video -t hh:mm:ss-hh:mm:ss -f fileformat
    ```
## INPUT
	- The link of the video (MANDATORY)
	- The portion of the video to trim with start and end times (OPTIONAL)
	- The output format (i.e. mp3, mpeg, mp4, flv ...) for the clip (OPTIONAL)
## OUTPUT
	A file _cut.fmt is created, where fmt is the format if it has
	been specified; otherwise the default mp4 is used.
	If -t option is not specified (not trimming), a file _out.mp4 is
	containing the whole video.
