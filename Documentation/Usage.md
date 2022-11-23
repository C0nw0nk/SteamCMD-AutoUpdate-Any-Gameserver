
# Usage

<br>

## Executable

The script comes in two flavors, however both  
automatically download and install game servers.

<br>

### [`steam.cmd`][Script]

This script utilizes **VBScript**.

### [`steam-CURL.cmd`][Script Curl]

This script is dependent on **CURL** and **Windows Powershell**.

<br>
<br>

## App Ids

*You can search for a game's appId on **[SteamDB]**.*

```bat
set appid=740
```

<br>

### Client - Server

Some games come with dedicated server that have a separate appId  
\- such as CS:GO - in which case you will have to specify the Id with:

```bat
set update_appid=730
```

<br>

### Validation

You can check if the second Id was successfully set by checking the  
`latest-version.txt`  file, which should look something like this:

```json
{
    "game": {

    }
}
```

<br>


<!----------------------------------------------------------------------------->

[Script Curl]: ../Source/steam-CURL.cmd
[Script]: ../Source/steam.cmd

[SteamDB]: https://steamdb.info/
