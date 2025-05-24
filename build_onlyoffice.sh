#!/bin/bash

. .env

docker run -e PRODUCT_VERSION=8.3.3 -e BUILD_NUMBER=18 -v $(pwd)/out:/build_tools/out onlyoffice-document-editors-builder-deps
