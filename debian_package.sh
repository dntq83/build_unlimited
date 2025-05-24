#!/bin/bash

set -e

. /build_unlimited/.env

DOCUMENT_SERVER_PACKAGE_PATH="/document-server-package"

cd ${DOCUMENT_SERVER_PACKAGE_PATH}

cat << EOF >> Makefile

deb_dependencies: \$(DEB_DEPS)

EOF

PRODUCT_VERSION="${PRODUCT_VERSION}" BUILD_NUMBER="${BUILD_NUMBER}" make deb_dependencies
cd ${DOCUMENT_SERVER_PACKAGE_PATH}/deb/build
apt-get -qq build-dep -y ./
cd ${DOCUMENT_SERVER_PACKAGE_PATH}
PRODUCT_VERSION="${PRODUCT_VERSION}" BUILD_NUMBER="${BUILD_NUMBER}" make deb
