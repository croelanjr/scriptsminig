#!/bin/bash
#export GPU_FORCE_64BIT_PTR=1
export GPU_MAX_HEAP_SIZE=100
export GPU_USE_SYNC_OBJECTS=1
export GPU_MAX_ALLOC_PERCENT=100
export GPU_SINGLE_ALLOC_PERCENT=100

#################################
## Begin of user-editable part ##
#################################

POOL=us-grin.2miners.com:3030
WALLET=2aHR0cHM6Ly9ncmluLmhvdGJpdC5pby82MTIwMTY.grin31croe01
PASS=x

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

/root/lolminer/lolMiner --coin GRIN-C31 --pool $POOL --user $WALLET --pass $PASS $@
