# Retropie Savegame Sync
This script allows to sync your savegames to the newest one between two RetroPie devices

## Usage
* Clone the repository or simply download it as a zip file and unzip it in your home folder
* Customize the variables in the script, if needed
* Schedule the script at each Raspberry boot (the script needs to be installed only on one of the two Retropies)

To schedule it:

    $ crontab -e
    
    
And add to your crontab the following row:

```
@reboot sleep 100 && /home/pi/bash-retropie-savegame-sync/retropie-savegame-sync.sh
```


### Contribution guidelines ###

* If you have any idea or suggestion contact directly the Repo Owner

### Who do I talk to? ###

* ltpitt: Repo Owner
