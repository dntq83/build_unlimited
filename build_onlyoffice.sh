#!/bin/bash

. .env

docker run -e PRODUCT_VERSION="${PRODUCT_VERSION}" -e BUILD_NUMBER="${BUILD_NUMBER}" -v $(pwd)/out:/build_tools/out onlyoffice-document-editors-builder-deps
