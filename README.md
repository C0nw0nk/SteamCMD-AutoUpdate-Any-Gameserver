# SteamCMD-AutoUpdate-Any-Gameserver

Download latest :
https://mega.co.nz/#!FZh2UIDI!QtLSRZADlTTB4S8bCAT0En9E3uYEbYvw7d-fduH7B2U

Windows SteamCMD to automaticly update and install any game server

I am sure all of you on windows have been seeking for this for a long time.

This will work for all game servers and keep them all automaticly updated. Inside my script i have written a little a detail on each function and what it is executing and the result. For those of you who are command line enthusiasts like myself.

#Why did i bother to make this ?
I got borred and when i get borred i have to do something productive this being the result. (I am a workaholic)

It is a command line file what you should replace your existing scripts with, One automatic updater per each game server you wish to run.

#Features :
Works with both 32bit and 64bit architecture.
Install game server.
Keep server updated on a interval (interval of updates is defined in seconds).
Should work with both Normal versions of Windows and Server versions.

#Requirements :
You need to have a SteamDEV API key you can obtain one from the following link http://steamcommunity.com/dev/apikey
Certain servers for specific games require you to use a login on SteamCMD so specify your login in the script.

#F.A.Q
I edited beyond the "Do not edit" point and now it does not work ?
I told you in the file not to touch anything beyond that point. (Just redownload the script to get a default working version.)

#Known bugs / issues :
If your game server is to crash you may have to wait for the next automatic update check as defined by the interval so the script checks if the game server is infact running or not. (Current soloution is to keep the update interval to a max of 10-15mins so if your server crashes it is not offline for long)

#How to use :
There are two different appid's you might have to specify for your game server to automaticly update. Since some games for example CS:GO have a seperate appid for the updater url than the appid you would use to install the game server as show below.

Install CS:GO server appid = 740

Auto Update URL appid = 730

You will know if you have to set a different appid for the update url if the contents of your latest-version.txt show this.

{
    "game": {

    }
}

To get the correct Auto Updater APPID just go to the store page for the game in question and it will be at the end of the URL link. http://store.steampowered.com/app/730/


#Configuration : (EDIT | main.cmd file)
:: This is the SteamDEV api key required for automatic updates ::
:: If you do not have one you may obtain your API key from here = http://steamcommunity.com/dev/apikey ::

set steamkey=

:: This is the required login for SteamCMD to download updates ::
:: example = login=C0nw0nk Password ::
:: For most game servers you do not require this and can leave it as anonymous ::
:: Certain game servers you have to use a username and password to install them ::

set login=anonymous

:: This is the directory you wish to install and keep your server updated to ::

set install_directory=C:\game-servers\CSGO

:: This is the app ID of the game server you are installing / running ::

set appid=740

:: This is the app ID the url will check for updates on that game ::
:: Some games this is the same as the installation appid other games it is a different numeric value ::
:: if your latest-version.txt file is empty you need to make this value different to the installation appid, just go to the steam store page and get the appid from the end url ::

set update_appid=730

:: This is for the directory where you installed steamcmd ::

set steamcmd_path=c:\steamcmd\steamcmd.exe

:: This is the path to the exe of the game server this allows us to close and run the server for and after a update ::
:: Example ::
:: set exe_path=C:\game-servers\CSGO\srcds.exe -game csgo -console -usercon +game_type 0 +game_mode 0 +mapgroup mg_active +map de_dust2 ::

set exe_path=

:: This is the title of your server this will help you know what server this auto updater is running for ::

set servername=My CSGO#1 Server

:: Automatic Updating Interval (in seconds) this will set how often you check the steam servers for a new update ::
:: I recommend 5-10 mins ::

set interval=300

Please drop a reply if you have a question / issue i shall try to help you as much as i can.
CURL (Generic) 32bit and 64bit executable from | http://curl.haxx.se/download.html
