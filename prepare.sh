#!/bin/bash
## Copyright (c) 2018-Present Energyparty Developers
## Distributed under the AGPL 3.0, see the accompanying file LICENSE or https://github.com/energyparty/energyparty

sudo apt-get -y install build-essential libssl-dev git
cd $HOME/energyparty
echo "WARNING: If you already have any EnergyCoin Core installed in this server, backup your wallet.dat first!"
echo "And make sure you have at least 4G free RAM and 20G free disk before proceed"
echo "Type Y to proceed, and it will delete any previous EnergyCoin installation"
read -n 1 -r -s -p "Type any other key to exit" key
echo
if [[ "$key" =~ [yY]$ ]]; then
   git clone https://github.com/energyparty/energycoin.git
   echo
   cd $HOME/energyparty/energycoin/src
   sudo apt-get -y install libboost-all-dev libdb-dev libdb++-dev
   echo
   chmod +x $HOME/energyparty/energycoin/src/leveldb/build_detect_platform
   make -f makefile.unix
   sleep 1
   chmod +x $HOME/energyparty/energycoin/src/energycoind
   sudo cp $HOME/energyparty/energycoin/src/energycoind /usr/local/bin/
   rm -rf $HOME/.EnergyCoin
   mkdir -p $HOME/.EnergyCoin
   cp $HOME/energyparty/config/EnergyCoin/EnergyCoin.conf.default $HOME/.EnergyCoin/EnergyCoin.conf
   sleep 1
   energycoind
fi
exit 0

