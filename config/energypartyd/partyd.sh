#!/bin/bash
cd $HOME/energyparty/energypartyd
sleep 1
python3 counterpartyd.py --force --config-file $HOME/energyparty/config/energypartyd/energypartyd.conf
