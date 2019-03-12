#!/bin/bash
cd $HOME/energyparty/energyblockd
sleep 1
python3 counterblockd.py --config-file $HOME/energyparty/config/energyblockd/energyblockd.conf
