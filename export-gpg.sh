#!/bin/bash

# -------------------------------------
# show gpg keys
# -------------------------------------
gpg --list-keys

# -------------------------------------
# Config and defaults
# -------------------------------------
GPG_UID=""
GPG_PREFIX=""


# -------------------------------------
# Requesting user input
# -------------------------------------
function uidRequest {
	read -p "Enter your GPG UID: " GPG_UID
	if [ -z "${GPG_UID}" ]; then
		echo "Unset or invalid UID..."
		uidRequest
	fi
}

function prefixRequest {
	read -p "Enter prefix for filenames: " GPG_PREFIX
}

# Request for UID
uidRequest

# Request prefix
prefixRequest
if [ -n "${GPG_PREFIX}" ]; then
	GPG_PREFIX="${GPG_PREFIX}-"
fi

# -------------------------------------
# Export files
# -------------------------------------
gpg -a --export $GPG_UID > "${GPG_PREFIX}public-gpg.key"
gpg -a --export-secret-keys $GPG_UID > "${GPG_PREFIX}secret-gpg.key"
gpg -a --export-secret-subkeys $GPG_UID > "${GPG_PREFIX}sub.key"
gpg --export-ownertrust > "${GPG_PREFIX}ownertrust.txt"
