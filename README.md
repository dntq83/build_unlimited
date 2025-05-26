# Build onlyoffice with unlimited users and smartphone feature

## Howto

Thoses instructions are only tested on Debian 12.

### Setup environment

#### Install basic tools

```
apt update && apt upgrade -y && apt install -y vim git fail2ban sudo tmux
```

#### Install docker

https://docs.docker.com/engine/install/debian/

#### Set build directory

Chose a build directory and export path to BUILD_DIR variable, for instance:

```
export BUILD_DIR=/opt/onlyoffice
```

#### Clone Git repositories

```
mkdir $BUILD_DIR && cd $BUILD_DIR
git clone https://code.globenet.org/gn/onlyoffice/build_unlimited.git
git clone https://code.globenet.org/gn/onlyoffice/build_tools.git
git clone https://github.com/ONLYOFFICE/document-server-package.git
```

### Build Onlyoffice

#### Setup docker images

```
cd $BUILD_DIR/build_tools
docker build --tag onlyoffice-document-editors-builder .
cd $BUILD_DIR/build_unlimited
docker build --tag onlyoffice-document-editors-builder-deps -f Dockerfile.deps .
```

#### Find Onlyoffice version

```
cd $BUILD_DIR/build_tools
git describe --abbrev=0 --tags
```

For instance: `v8.3.3.18` where 8.3.3 is the current version and 18 the build
number. You can edit `$BUILD_DIR/build_unlimited/.env` accordingly (the build
number can be your own).

#### Compile Onlyoffice

```
cd $BUILD_DIR/build_unlimited
./build_onlyoffice.sh
```

Onlyoffice binaries are available in `$BUILD_DIR/build_tools/out/`.

### Build Debian packages

#### Setup docker image

```
cd $BUILD_DIR/build_unlimited
docker build --tag onlyoffice-deb-builder . -f Dockerfile.packages
```

#### Make Debian packages

```
cd $BUILD_DIR/build_unlimited
./build_debian_packages.sh
```

Debian packages are available in `$BUILD_DIR/document-server-package/deb/`.

## Usefull Links

* https://helpcenter.onlyoffice.com/fr/docs/installation/docs-community-compile-document-builder.aspx
* https://github.com/btactic-oo/unlimited-onlyoffice-package-builder
