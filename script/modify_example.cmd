.\..\bin\imagemagick\convert .\..\image\background.jpg \
   ( ./../image/logo.png -thumbnail x25 ) -gravity west   -geometry  +0+30 -composite \
   ( ./../image/logo.png -thumbnail x25 ) -gravity center -geometry +80+30 -composite \
   ( ./../image/logo.png -thumbnail x25 ) -gravity east   -geometry  +0+30 -composite \
   .\output.png