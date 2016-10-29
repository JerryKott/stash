#!/bin/bash

# Create a temp directory first
TEMP=`mktemp -d -t 'stash'`
echo $TEMP
pushd $TEMP

#Get and unpack the VM
curl -o bin.zip https://github.com/JerryKott/stash/blob/master/bin/macx.zip
unzip bin.zip
chmod a+x macx/stash32

#Get and unpack the stash image
curl -o image.zip https://github.com/JerryKott/stash/blob/master/image/image.zip
unzip image.zip

#Get and unpack the installation script
curl -o script.zip https://github.com/JerryKott/stash/blob/master/scripts/macx.zip
unzip script.zip
chmod a+x macx/stash


TARGET=/usr/local/stash
mkdir $TARGET
cp -a macx/stash32 $TARGET/macx/
cp -a macx/stash $TARGET/
cp -a stash.im $TARGET/

#Get and unpack examples.
curl -o examples.zip https://github.com/JerryKott/stash/blob/master/examples.zip
unzip examples.zip
mv examples $TARGET/

rm -rf *

popd
