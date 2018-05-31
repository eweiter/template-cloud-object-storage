#!/bin/bash

set -ex

# Build script for Travis-CI.

SCRIPTDIR=$(cd $(dirname "$0") && pwd)
ROOTDIR="$SCRIPTDIR/../.."
WHISKDIR="$ROOTDIR/../openwhisk"
UTILDIR="$ROOTDIR/../incubator-openwhisk-utilities"
HOMEDIR="$SCRIPTDIR/../../../"

# clone utilties repo. in order to run scanCode.py
cd ${HOMEDIR}
git clone --depth 1 https://github.com/apache/incubator-openwhisk-utilities.git

# shallow clone OpenWhisk repo.
git clone --depth 1 https://github.com/apache/incubator-openwhisk.git openwhisk

# shallow clone deploy package repo.
git clone --depth 1 https://github.com/apache/incubator-openwhisk-package-deploy

# shallow clone deploy package repo.
git clone --depth 1 https://github.com/ibm-functions/package-cloud-object-storage

cd openwhisk
./tools/travis/setup.sh
