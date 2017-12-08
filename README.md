# Retropie Savegame Sync
This script allows to sync your savegames to the newest one between two RetroPie devices

## Usage
* Be sure that you can access your Retropie installation via ssh (from one to another) without using password. Here's how to obtain such result: https://www.ssh.com/ssh/copy-id
* Clone the repository or simply download it as a zip file and unzip it in your home folder
* Customize the variables in the script, if needed
* Schedule the script at each Raspberry boot (the script needs to be installed only on one of the two Retropies)

To schedule it:

    $ crontab -e
    
    
And add to your crontab the following row:

```
@reboot sleep 100 && /home/pi/bash-retropie-savegame-sync/retropie-savegame-sync.sh
```

## Important notice
The script is just a quick hack and in beta version. It will make a complete backup of both your Retropie savegames in the folder specified among the variables.  Nonetheless this is not bullet proof and test it at your own risk.  More updates will come, have fun!

### Contribution guidelines ###

* If you have any idea or suggestion contact directly the Repo Owner

### Who do I talk to? ###

* ltpitt: Repo Owner
