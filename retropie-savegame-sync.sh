# https://github.com/ltpitt
#
# This is a very quick and sloppy script to keep savegames
# in sync between two RetroPie devices
#
# I've tested it using a Raspberry Pi 3 and a Gameboy Zero
# You can launch it manually or add it to cron or /etc/rc.local
#
# If you plan to execute it automatically you have to  be sure 
# that all ssh sources are accessible without password requests
# using, for example, ssh-copy-id

# Customize the following variables according to your setup
SOURCE_1="pi@retropie:/home/pi/RetroPie/roms/"
SOURCE_2="pi@gameboyzero:/home/pi/RetroPie/roms/"
TARGET="/your/target/folder/"
BACKUP="/home/pi/backup_savegames/"

# There should be no need to change anything below this line
clear
NOW=`date +"%Y%m%d%H%M"`
echo "RetroPie Savegame SyncThingie"
echo
echo "Creating SOURCE_1 and SOURCE_2 backup folder into: $BACKUP$NOW..."
mkdir -p $BACKUP$NOW/SOURCE_1
mkdir -p $BACKUP$NOW/SOURCE_2
echo
echo "Backing up $SOURCE_1 savegames into: $BACKUP$NOW/SOURCE_1..."
rsync -avzp --include '*/' --include '*.srm' --exclude '*' $SOURCE_1 $BACKUP$NOW/SOURCE_1
echo
echo "Backing up $SOURCE_1 savegames into: $BACKUP$NOW/SOURCE_1..."
rsync -avzp --include '*/' --include '*.srm' --exclude '*' $SOURCE_2 $BACKUP$NOW/SOURCE_2
echo
echo "Updating to newest version all savegames in $TARGET"
rsync -avzp --include '*/' --include '*.srm' --exclude '*' $SOURCE_1 $TARGET
rsync -avzp --include '*/' --include '*.srm' --exclude '*' $SOURCE_2 $TARGET
echo "Done! :)"
