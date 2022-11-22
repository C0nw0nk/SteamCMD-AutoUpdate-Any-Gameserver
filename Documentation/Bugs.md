
# Known bugs / issues :

If your game server is to crash you may have to wait for the next automatic update check as defined by the interval so the script checks if the game server is infact running or not. (Current soloution is to keep the update interval to a max of 10-15mins so if your server crashes it is not offline for long) set interval=60 (1 minute)

Certain Appid's for installation of game server will be different to the update id due to Steam's DEV API not containing the latest avaliable server version (yet!?)

### Example :

http://api.steampowered.com/ISteamUserStats/GetSchemaForGame/v2/?key=YOURKEYHERE&appid=740&format=json


