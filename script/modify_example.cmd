REM .\..\bin\imagemagick\magick composite -gravity center logo.png  rose: background.jpg
.\..\bin\imagemagick\magick ^
	background.jpg ^
	logo.png ^
	-gravity center ^
	-composite ^
	output.png