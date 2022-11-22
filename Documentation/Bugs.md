
# Known Bugs

<br>

### Crashing Game Server

A crashed game server will wait until the next automatic update check  
before it restarts, as it only then checks if the server is actually running.

<br>

#### Solution

Keep the update interval to a maximum of about 10 - 15 minutes,  
doing this will ensure that your server won't be offline for long.

`interval=60` sets the interval to 1 minute.

<br>
<br>

### AppId Mismatches

Certain app ids for the installation of game servers can be different to  
their update Id, this is due to Steam's DEV API not containing the latest  
available server version at the time.

<br>

#### Example

```
http://api.steampowered.com/ISteamUserStats/GetSchemaForGame/v2/?key=< API Key >&appid=740&format=json
```

<br>
