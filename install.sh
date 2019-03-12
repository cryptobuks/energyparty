#!/bin/bash
## Copyright (c) 2018-Present Energyparty Developers
## Distributed under the AGPL 3.0, see the accompanying file LICENSE or https://github.com/energyparty/energyparty

cd $HOME/energyparty
echo "If you want to install energypartyd, type 1 to proceed"
echo "If you want to install energyblockd, type 2 to proceed"
echo "If you want to install energywallet, type 3 to proceed"
read -n 1 -r -s -p "Type any other key to exit" key
echo
case "$key" in
  1*)
    echo "Remember to wait for the EnergyCoin Core (Energyparty version) to sync before you install energypartyd"
    read -n 1 -r -s -p "Type any key to proceed (or CTRL C to exit)"
    sudo apt-get -y install python3-dev python3-pip libsqlite3-dev libxml2-dev libxslt-dev libjpeg-dev mongodb screen
    echo
    pip3 install appdirs prettytable python-dateutil flask json-rpc pycoin requests Flask-HTTPAuth pycrypto apsw cython gevent pymongo redis pillow lxml rollbar jsonschema strict_rfc3339 rfc3987 aniso8601 pygeoip colorama grequests
    echo
    git clone https://github.com/energyparty/energypartyd.git
    mkdir -p $HOME/.local/share
    chmod +x $HOME/energyparty/config/energypartyd/partyd.sh
    screen -dmS eparty $HOME/energyparty/config/energypartyd/partyd.sh ;;
  2*)
    echo "Remember to wait for the energypartyd to sync before you install energyblockd"
    read -n 1 -r -s -p "Type any key to proceed (or CTRL C to exit)"
    git clone https://github.com/energyparty/energyblockd.git
    mkdir -p $HOME/.local/share/energyblockd
    wget --no-check-certificate https://www.archlinux.org/packages/extra/any/geoip-database/download/ -O geoipDB.tar.xz
    echo
    tar xf geoipDB.tar.xz
    cp usr/share/GeoIP/GeoIP.dat $HOME/.local/share/energyblockd/
    chmod +x $HOME/energyparty/config/energyblockd/blockd.sh
    screen -dmS eblock $HOME/energyparty/config/energyblockd/blockd.sh ;;
  3*)
    echo "Remember to wait for the energyblockd to sync before you install energywallet"
    echo "And if you already have nginx or other web server installed, do backup and uninstall it first."
    read -n 1 -r -s -p "Type any key to proceed (or CTRL C to exit)"
    sudo apt-get -y install nginx npm
    echo
    sudo npm install -g grunt-cli bower
    echo
    sudo ln -s /usr/bin/nodejs /usr/bin/node
    git clone https://github.com/energyparty/energywallet.git
    cd $HOME/energyparty/energywallet/src
    bower install
    echo
    cd $HOME/energyparty/energywallet
    npm install
    echo
    sudo mv build /var/www/html/
    sudo chown -R www-data:www-data /var/www/html/
    sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.backup
    sudo cp $HOME/energyparty/config/energywallet/default /etc/nginx/sites-available/
    sudo cp $HOME/energyparty/config/energywallet/counterblock_api.inc /etc/nginx/
    sudo cp $HOME/energyparty/config/energywallet/energywallet.conf.json.default /etc/nginx/energywallet.conf.json
    sleep 1
    sudo systemctl restart nginx ;;
esac
exit 0

