#!/bin/bash

# -------------------------------------
# Filename statics
# -------------------------------------
GPG_PUBLIC_FILE="public-gpg.key"
GPG_SECRET_FILE="secret-gpg.key"
GPG_SUB_FILE="sub-gpg.key"
GPG_OWNERTRUST_FILE="ownertrust.txt"


# -------------------------------------
# Find and import public file
# -------------------------------------
GPG_PUBLIC_FILE=$(find . -name "*${GPG_PUBLIC_FILE}")
if [ ! -z "${GPG_PUBLIC_FILE}" ]; then
	echo "Importing GPG public file... ${GPG_SECRET_FILE}"
	gpg --import $GPG_PUBLIC_FILE
	echo "Done!"
fi

# -------------------------------------
# Find and import secret file
# -------------------------------------
GPG_SECRET_FILE=$(find . -name "*${GPG_SECRET_FILE}")
if [ ! -z "${GPG_SECRET_FILE}" ]; then
        echo "Importing GPG secret file... ${GPG_SECRET_FILE}"
        gpg --import $GPG_PUBLIC_FILE
	echo "Done!"
fi

# -------------------------------------
# Find and import sub file
# -------------------------------------
GPG_SUB_FILE=$(find . -name "*${GPG_SUB_FILE}")
if [ ! -z "${GPG_SUB_FILE}" ]; then
        echo "Importing GPG sub file... ${GPG_SUB_FILE}"
        gpg --import $GPG_SUB_FILE
        echo "Done!"
fi

# -------------------------------------
# Find and import ownertrust file
# -------------------------------------
GPG_OWNERTRUST_FILE=$(find . -name "*${GPG_OWNERTRUST_FILE}")
if [ ! -z "${GPG_OWNERTRUST_FILE}" ]; then
        echo "Importing GPG ownertrust file... ${GPG_OWNERTRUST_FILE}"
        gpg --import-ownertrust $GPG_OWNERTRUST_FILE
        echo "Done!"
fi
