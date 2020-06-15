# NOAAWallpaper
## Update (GNOME?) Wallpaper with latest synoptic weather chart from NOAA
This script will get the latest synoptic weather chart, --- a map showing air pressure and weather fronts for the north american continent --- from the noaa website (https://www.wpc.ncep.noaa.gov/html/sfc-zoom.php) and then change the current wallpaper to this image.
- To use, add a call to the script as a **crontab** (man crontab) with an appropriate interval, the noaa image is updated every 3h.
- Optionally you can also add the script to  **/etc/profile.d** which will run it on login.(not that the script may throw errors and these may sometimes give problems when logging in).
