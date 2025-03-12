#!/bin/bash

# Repository details
REPO_URL="https://api.github.com/repos/accupara/crave/releases/latest"

# Get the latest release information
RELEASE_INFO=$(curl -s "$REPO_URL")

# Extract the download URL for the aarch64 binary
DOWNLOAD_URL=$(echo "$RELEASE_INFO" | jq -r '.assets[] | select(.name | contains("aarch64")) | .browser_download_url')

if [ -z "$DOWNLOAD_URL" ]; then
    echo "Error: Could not find aarch64 binary in the latest release."
    exit 1
fi

# Extract the version number
VERSION=$(echo "$RELEASE_INFO" | jq -r '.tag_name')

if [ -z "$VERSION" ]; then
    echo "Error: Could not extract the version tag."
    exit 1
fi

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
    curl -L -o /usr/bin/crave "$DOWNLOAD_URL"
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
