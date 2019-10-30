#!/bin/bash

# -------------------------------------
# Filename statics
# -------------------------------------
GPG_PUBLIC_FILE="public-gpg.key"
GPG_SECRET_FILE="secret-gpg.key"
GPG_SUB_FILE="sub-gpg.key"
GPG_OWNERTRUST_FILE="ownertrust.txt"

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
gpg -a --export $GPG_UID > "${GPG_PREFIX}${GPG_PUBLIC_FILE}"
gpg -a --export-secret-keys $GPG_UID > "${GPG_PREFIX}${GPG_SECRET_FILE}"
gpg -a --export-secret-subkeys $GPG_UID > "${GPG_PREFIX}${GPG_SUB_FILE}"
gpg --export-ownertrust > "${GPG_PREFIX}${GPG_OWNERTRUST_FILE}"
