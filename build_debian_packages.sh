#!/bin/bash

. .env

docker run -v $(pwd)/../build_tools:/build_tools:ro -v $(pwd)/../document-server-package:/document-server-package:rw  $(pwd)/newfonts:/newfonts:ro onlyoffice-deb-builder
