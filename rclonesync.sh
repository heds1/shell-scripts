#!/bin/bash
# run rclone sync to backup user files

# define source and remote dirs/destinations
SOURCEDIR=~/docs/
REMOTEDIR=remote:

# define logfile
LOGFILE=~/synclog.txt

# for quick testing
#TARGETDIRS=('finance')
TARGETDIRS=('employment' 'finance' 'pics' 'notes' 'personal')

# loop over target folders to sync
for folder in "${TARGETDIRS[@]}"
    do
        # send status text to logfile
	printf "Syncing $folder folder...\n" >> ${LOGFILE}

	# sync files and append output to logfile
        rclone sync $SOURCEDIR/$folder $REMOTEDIR$folder -v &>> ${LOGFILE}
    done
