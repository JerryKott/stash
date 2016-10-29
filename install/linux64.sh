#!/bin/bash

# Create a temp directory first
TEMP=`mktemp -d -t 'stash.XXXXXX'`
echo $TEMP
pushd $TEMP

#Get and unpack the VM
wget -O bin.zip https://raw.githubusercontent.com/JerryKott/stash/master/bin/linuxx86_64.zip
unzip bin.zip
chmod a+x linuxx86_64/stash64

#Get and unpack the stash image
wget -O image.zip https://raw.githubusercontent.com/JerryKott/stash/master/image/image.zip
unzip image.zip

#Get and unpack the installation script
wget -O script.zip https://raw.githubusercontent.com/JerryKott/stash/master/scripts/macx.zip
unzip script.zip
chmod a+x macx/stash


TARGET=/usr/local/stash
mkdir $TARGET
mkdir $TARGET/linuxx86_64
cp -a linuxx86_64/stash64 $TARGET/linuxx86_64/
cp -a linuxx86_64/stash $TARGET/
cp -a stash.im $TARGET/

#Get and unpack examples.
wget -O examples.zip https://raw.githubusercontent.com/JerryKott/stash/master/examples.zip
unzip examples.zip
mv examples $TARGET/

rm -rf *

popd
