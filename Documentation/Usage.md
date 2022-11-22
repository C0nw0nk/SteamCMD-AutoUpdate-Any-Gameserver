
# How to use :
Choose either `steam.cmd` or `steam-CURL.cmd`

The steam.cmd file uses VBScript and steam-curl.cmd is dependant on CURL and Windows Powershell.

Both will automaticly download and install game servers upon running either script.

There are two different appid's you might have to specify for your game server to automaticly update. Since some games for example CS:GO has a seperate appid for the updater url than the appid you would use to install the game server as show below.

Install CS:GO server appid = 740

`set appid=740`

Auto Update URL appid = 730

`set update_appid=730`

You will know if you have to set a different appid for the update url if the contents of your latest-version.txt show this.

```
{
    "game": {

    }
}
```

To get the correct Auto Updater APPID just go to the store page for the game in question and it will be at the end of the URL link.

http://store.steampowered.com/app/730/