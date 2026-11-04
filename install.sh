#!/bin/sh

mkdir /opt/warpscout
cd /opt/warpscout
downurl = $( curl -sS 'https://api.github.com/repos/vernette/warpscout/releases/latest' | grep -iF '"browser_down
load_url"' | grep -iF '_linux_arm64.'|sed 's/"[^"]*$//;s/^.*"//' )
curl -kL "$downurl" | tar -xz
echo '/opt/warpscout register -fresh -gen-junk' >/opt/warpscout/warpscout.sh
echo '/opt/warpscout scan -p awg -gen-junk -P -exclude-country RU -conf "/opt/warpscout/WARP.conf' >>/opt/warpscout/warpscout.sh
chmod +x /opt/warpscout/warpscout.sh
ln -s /opt/warpscout/warpscout.sh /opt/bin/wscout
