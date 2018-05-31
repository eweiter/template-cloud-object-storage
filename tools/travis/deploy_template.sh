#!/bin/bash
set -ex

# Build script for Travis-CI.

SCRIPTDIR=$(cd $(dirname "$0") && pwd)
ROOTDIR="$SCRIPTDIR/../.."
HOMEDIR="$ROOTDIR/.."
WHISKDIR="$HOMEDIR/openwhisk"
# Set Environment
export OPENWHISK_HOME=${OPENWHISK_HOME:=$WHISKDIR}
WSK_CLI=${OPENWHISK_HOME}/bin/wsk
WSK_SYSTEM_AUTH_KEY=$(cat ${OPENWHISK_HOME}/ansible/files/auth.whisk.system)
WHISK_APIHOST="172.17.0.1"


PREINSTALL_DIR=${HOMEDIR}/preInstalled

cd ${ROOTDIR}
# Place this package in correct location to be included in packageDeploy
mkdir -p ${PREINSTALL_DIR}/ibm-functions/package-cloud-object-storage
cp -a $HOMEDIR/package-cloud-object-storage/runtimes ${PREINSTALL_DIR}/ibm-functions/package-cloud-object-storage/

# Place this template in correct location to be included in packageDeploy
mkdir -p ${PREINSTALL_DIR}/ibm-functions/template-cloud-object-storage
cp -a runtimes ${PREINSTALL_DIR}/ibm-functions/template-cloud-object-storage/

# Install the deploy package
cd $HOMEDIR/incubator-openwhisk-package-deploy/packages
./installCatalog.sh $WSK_SYSTEM_AUTH_KEY $WHISK_APIHOST $WSK_CLI