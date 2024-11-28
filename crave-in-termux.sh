#!/bin/bash

# Install required packages in Termux
echo ""
echo "#####################################"
echo "Installing required Termux packages.."
echo "#####################################"
echo ""
pkg update && pkg install ca-certificates curl git proot wget -y
echo ""
sleep 1
echo "done."

echo ""
sleep 1

# Install Ubuntu in Termux
echo "#############################"
echo "Installing Ubuntu in Termux.."
echo "#############################"
curl -LSs https://raw.githubusercontent.com/GhostMaster69-dev/crave-in-termux/refs/heads/master/ubuntu.sh | bash &>/dev/null
echo ""
echo "done."
	
echo ""
sleep 1

# Install Crave in Termux
echo "##############################"
echo "Setup crave in Ubuntu (Termux)"
echo "##############################"
echo ""
./startubuntu.sh "apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends ca-certificates curl git openssh-client python-is-python3 rsync wget -y && curl -LSs "https://raw.githubusercontent.com/GhostMaster69-dev/crave-in-termux/refs/heads/master/install-crave.sh" | bash"

sleep 1
echo ""
echo "Start with ./startubuntu.sh"
