Copyright (c) 2018-Present Energyparty Developers. All rights reserved.

# Energyparty Installation Guide

Tested on Ubuntu server 16.04 (64bit).


### How it works

The Energyparty program consists of 3 main parts: energypartyd, energyblockd and energywallet.

Only energypartyd is a **MUST** to install. Before installing energypartyd, a working [EnergyCoin Core (Energyparty version)](https://github.com/energyparty/energycoin) is required. 

Both energyblockd and energywallet are **OPTIONAL**. They are necessary if you need to run a local web-wallet in your own server.

Before installing energyblockd, a working energypartyd is required.

Before installing energywallet, a working energyblockd is required.


### Step 1: Install dependencies

WARNING: If you already have any EnergyCoin Core (including the [original one](https://github.com/EnergyCoinProject/energycoin) i.e.: non-Energyparty version) installed in your server, backup your wallet.dat first! Because this setup will delete any previous EnergyCoin installation.

Download the Energyparty install scripts [here](https://github.com/energyparty/energyparty/archive/master.zip).

And then unzip it, rename its folder name to `energyparty`, and move this folder under your $HOME folder.

Then run in terminal:
`chmod +x $HOME/energyparty/prepare.sh; $HOME/energyparty/prepare.sh`

If you type Y, it will install and launch the EnergyCoin Core (Energyparty version). You have to wait for it to sync before installing energypartyd. Bootstrap files of the original EnergyCoin Core (non-Energyparty version) do NOT work for Energyparty.

If you already have the EnergyCoin Core (Energyparty version) installed and running in your server, type any other key to exit.


### Step 2: Install Energyparty

Run in terminal:
`chmod +x $HOME/energyparty/install.sh; $HOME/energyparty/install.sh`

If you type 1, it will install energypartyd.

It will also launch energypartyd inside a detached screen. You should wait for it to sync before installing energyblockd.

If you type 2, it will install energyblockd.

It will also launch energyblockd inside a detached screen. You should wait for it to sync before installing energywallet.

If you type 3, it will install energywallet.

After that, you may access your local web-wallet by typing URL `http://localhost` in browser.


License: AGPL 3.0
