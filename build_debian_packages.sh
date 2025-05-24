#!/bin/bash

. .env

docker run -v $(pwd)/../build_tools:/build_tools:ro -v $(pwd)/../document-server-package:/document-server-package:rw onlyoffice-deb-builder /bin/bash -c "/unlimited-build/debian_package.sh"
