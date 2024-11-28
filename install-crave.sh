#!/bin/bash

CRAVE_VERSION="0.2-7064"

echo ""

# Setup Crave
command -v crave >/dev/null 2>&1
if ! [[ $? -eq 0 ]]; then
    echo "######################"
    echo "Crave is not installed"
    echo "######################"
    sleep 1
    echo ""

    echo "###################"
    echo "Installing Crave.."
    echo "###################"
    wget https://github.com/accupara/crave/releases/download/$CRAVE_VERSION/crave-$CRAVE_VERSION-linux-aarch64.bin &>/dev/null
    mv crave-$CRAVE_VERSION-linux-aarch64.bin /usr/bin/crave
    chmod a+x /usr/bin/crave
    echo ""
    sleep 1
    echo "done."
fi

command -v crave >/dev/null 2>&1

# Setup devspace
if [[ $? -eq 0 ]]; then
    cp -rf /storage/emulated/0/Download/crave.conf* $HOME/crave.conf &>/dev/null

    echo ""
    sleep 1

    if [ -f "$HOME/crave.conf" ]; then
        echo "##########################"
        echo "Crave Devspace is ready."
	echo "##########################"
    else
	echo "##########################"
	echo "crave.conf not found..."
	echo "##########################"
    fi

# Install repo
    command -v repo >&/dev/null
    if ! [[ $? -eq 0 ]]; then
	
	sleep 1
        echo ""

	echo "##########################"
	echo "Installing repo.."
	echo "##########################"
	wget https://commondatastorage.googleapis.com/git-repo-downloads/repo >&/dev/null
	mv repo /usr/bin/repo
	chmod a+x /usr/bin/repo

	sleep 1
	echo ""
	echo "done."
    fi
    echo ""
fi
