#!/bin/bash

. .env

docker run -e PRODUCT_VERSION="${PRODUCT_VERSION}" -e BUILD_NUMBER="${BUILD_NUMBER}" -v $(pwd)/../build_tools/out:/build_tools/out onlyoffice-document-editors-builder-deps
