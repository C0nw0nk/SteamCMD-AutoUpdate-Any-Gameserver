# SteamCMD-AutoUpdate-Any-Gameserver

Download latest :
https://mega.co.nz/#!8cxUXLqZ!JrMegCgHpW8K4038lc5q2_E8dWsHQJkL77mx_Z9GQsg

Windows SteamCMD to automaticly update and install any game server

I am sure all of you on windows have been seeking for this for a long time.

This will work for all game servers and keep them all automaticly updated. You may also use this to freshly and easly install game servers too. Inside my script i have written a little a detail on each function and what it is executing and the result. For those of you who are command line enthusiasts like myself.

#Why did i bother to make this ?
I got borred and when i get borred i have to do something productive this being the result. (I am a workaholic)

It is a command line file what you should replace your existing .bat / .cmd scripts with, One automatic updater per each game server you wish to run.

#Features :
Works with both 32bit and 64bit architecture.
Install game server.
Keep server updated on a interval (interval of updates is defined in seconds).
Should work with both Normal versions of Windows and Server versions.
Suppress application hung messages to prevent server crash problems.

#Requirements :
You need to have a SteamDEV API key you can obtain one from the following link http://steamcommunity.com/dev/apikey
Certain servers for specific games require you to use a login on SteamCMD so specify your login in the script.

#F.A.Q
I edited beyond the "Do not edit" point and now it does not work ?
I told you in the file not to touch anything beyond that point. (Just redownload the script to get a default working version.)

#Known bugs / issues :
If your game server is to crash you may have to wait for the next automatic update check as defined by the interval so the script checks if the game server is infact running or not. (Current soloution is to keep the update interval to a max of 10-15mins so if your server crashes it is not offline for long) set interval=60 (1 minute)

Certain Appid's for installation of game server will be different to the update id due to Steam's DEV API not containing the latest avaliable server version (yet!?) Example : http://api.steampowered.com/ISteamUs...40&format=json


#How to use :
You can download SteamCMD from here : http://media.steampowered.com/installer/steamcmd.zip

There are two different appid's you might have to specify for your game server to automaticly update. Since some games for example CS:GO has a seperate appid for the updater url than the appid you would use to install the game server as show below.

Install CS:GO server appid = 740
 set appid=740
Auto Update URL appid = 730
 set update_appid=730

You will know if you have to set a different appid for the update url if the contents of your latest-version.txt show this.

{
    "game": {

    }
}

To get the correct Auto Updater APPID just go to the store page for the game in question and it will be at the end of the URL link. http://store.steampowered.com/app/730/


#Configuration : (EDIT | steam.cmd file)

In order to configure the script just edit the "steam.cmd" file and define your install directory and server type.

Please drop a reply if you have a question / issue i shall try to help you as much as i can.

CURL (Generic) 32bit and 64bit executable from | http://curl.haxx.se/download.html#Win32
