#!/usr/bin/env bash
set -o pipefail

if [[ ${TRAVIS_OS_NAME} == "osx" ]]; then
  brew update
  brew install nvm
  mkdir ~/.nvm
  touch ~/.bashrc
  echo "export NVM_DIR=\"$HOME/.nvm\"" >> ~/.bashrc
  echo "[ -s \"/usr/local/opt/nvm/nvm.sh\" ] && . \"/usr/local/opt/nvm/nvm.sh\"" >> ~/.bashrc

  brew install mesa

  brew cask reinstall xquartz

  sudo defaults write org.macosforge.xquartz.X11 enable_iglx -bool true

  # brew install pkg-config

  # git clone https://github.com/XQuartz/xorg-server.git
  # cd xorg-server

  # export ACLOCAL="aclocal -I /opt/X11/share/aclocal -I /usr/local/share/aclocal"
  # export PKG_CONFIG_PATH="/opt/X11/share/pkgconfig:/opt/X11/lib/pkgconfig"
  # export CFLAGS="-Wall -O0 -ggdb3 -arch x86_64 -pipe"
  # export OBJCFLAGS=$CFLAGS
  # export LDFLAGS=$CFLAGS

  # autoreconf -fvi
  #   ./configure --prefix=/opt/X11 --disable-dependency-tracking --enable-maintainer-mode --with-apple-application-name=XQuartz --with-bundle-id-prefix=org.macosforge.xquartz --disable-xquartz --enable-xvfb
  # make
  # sudo make install
else
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
fi
