#!/bin/bash

cd bazuka
git pull origin master
cargo install --path .
service zeeka stop
mv bazuka bazuka_`date +%d%m%Y`
cp target/release/bazuka .

rm -rf /root/.bazuka
echo "Database deleted"
rm /root/.bazuka-wallet
echo "Wallet deleted"
sleep 3

bazuka init --network pelmeni-5 --mnemonic "pink crazy average laptop bus pond screen despair maximum smooth seat sun" --external 178.208.252.54:8765 --bootstrap 65.108.193.133:8765 --bootstrap 213.14.138.127:8765

service zeeka start
journalctl -fn 100 -u zeeka
