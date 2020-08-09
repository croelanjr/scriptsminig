#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=us-grin.2miners.com
PORT=3030
WALLET=2aHR0cHM6Ly9ncmluLmhvdGJpdC5pby82MTIwMTY.grin32croe01
PASS=x

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

/root/lolminer/lolMiner --coin GRIN-C32 --pool $POOL --port $PORT --user $WALLET --pass $PASS $@
