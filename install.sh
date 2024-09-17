#!/bin/bash

curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh

git clone https://github.com/danlin/my-distrobox.git

pushd my-distrobox
./init.sh
popd
