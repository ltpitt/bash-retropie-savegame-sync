# RetroPie Savegame SyncThingie by @pitto
# https://github.com/ltpitt
#
# This script keeps to keep savegames in sync between two
# RetroPie devices (e.g. a Raspberry Pi 3 and a Gameboy Zero)
#
# You can launch it manually or add it to cron or /etc/rc.local
#
# If you plan to execute it automatically you have to  be sure 
# that all ssh sources are accessible without password requests
# using, for example, ssh-copy-id

# Customize the following variables according to your setup
LOCAL_ROM_FOLDER="/home/pi/RetroPie/roms/"
REMOTE_ROM_FOLDER="pi@retropie:/home/pi/RetroPie/roms/"
BACKUP="/home/pi/RetroPie/backup_savegames/"

# There should be no need to change anything below this line
clear
# With set -e the script will quit in case of any error, better safe than sorry
set -e
# In the now variable I put a timestamp that will be later used in backup folder name
NOW=`date +"%Y%m%d%H%M"`
echo "RetroPie Savegame SyncThingie"
echo
echo "Creating LOCAL_SAVEGAMES and REMOTE_SAVEGAMES folders into: $BACKUP$NOW..."
mkdir -p $BACKUP$NOW/local_savegames
mkdir -p $BACKUP$NOW/remote_savegames
echo
echo "Backing up $LOCAL_ROM_FOLDER savegames into: $BACKUP$NOW/LOCAL_SAVEGAMES..."
rsync -avzp --include '*/' --include '*.srm' --include '*.sav' --include '*.state' --exclude '*' $LOCAL_ROM_FOLDER $BACKUP$NOW/local_savegames
echo
echo "Backing up $REMOTE_ROM_FOLDER savegames into: $BACKUP$NOW/REMOTE_SAVEGAMES..."
rsync -avzp --include '*/' --include '*.srm' --include '*.sav' --include '*.state' --exclude '*' $REMOTE_ROM_FOLDER $BACKUP$NOW/remote_savegames
echo
echo "Updating to newest version savegames in $LOCAL_ROM_FOLDER and $REMOTE_ROM_FOLDER"
rsync -avzp --update --include '*/' --include '*.srm' --include '*.sav' --include '*.state' --exclude '*' $LOCAL_ROM_FOLDER $REMOTE_ROM_FOLDER
rsync -avzp --update --include '*/' --include '*.srm' --include '*.sav' --include '*.state' --exclude '*' $REMOTE_ROM_FOLDER $LOCAL_ROM_FOLDER
echo "Done! :)"
