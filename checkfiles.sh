#!/bin/bash


IFS=$'\n'
KERNELDIR=/home/breno/Devel/linux
COMPLAINTS=/home/breno/Devel/beam/BEAM_ERRORS

for i in `cat commits`; do
	COMMIT=$(echo $i  | awk '{print $1}')
	FILE=$(echo $i  | awk '{print $2}')  # append .o for binaries
	FULLFILE="$KERNELDIR/$FILE"
	DESC=$(git show --oneline $COMMIT | head -1 | awk '{$1 = ""; $2 = ""; print $0}')

	if [[ $(cat $COMPLAINTS | grep $FILE) ]]; then
		COMPLAINED='Y'
	else
		COMPLAINED='N'
	fi

	if [[ $(ls $FULLFILE".o" 2> /dev/null)  ]]; then
		COMPILED='Y'
	else
		COMPILED='N'
	fi

	echo $COMPILED $COMPLAINED $DESC # ($COMMITID)
done
