#!/bin/sh

wsdir=/opt/warpscout
wssh=warpscout.sh
mkdir $wsdir
cd $wsdir
downurl=$( curl -sS 'https://api.github.com/repos/vernette/warpscout/releases/latest' | grep -iF '"browser_download_url"' | grep -iF '_linux_arm64.' | sed 's/"[^"]*$//;s/^.*"//' )
curl -kL "$downurl" | tar -xz
echo '#!/bin/sh' >$wsdir/$wssh
echo "$wsdir/warpscout register -fresh -gen-junk" >>$wsdir/$wssh
echo "$wsdir/warpscout scan -p awg -gen-junk -P -exclude-country RU -conf $wsdir/WARP.conf" >>$wsdir/$wssh
chmod +x $wsdir/$wssh
ln -s $wsdir/$wssh /opt/bin/wscout
