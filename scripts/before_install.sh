#!/usr/bin/env bash
set -o pipefail

if [[ ${TRAVIS_OS_NAME} == "osx" ]]; then
  sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /

  brew install nvm
  mkdir ~/.nvm
  touch ~/.bashrc
  echo "export NVM_DIR=\"$HOME/.nvm\"" >> ~/.bashrc
  echo "[ -s \"/usr/local/opt/nvm/nvm.sh\" ] && . \"/usr/local/opt/nvm/nvm.sh\"" >> ~/.bashrc
else
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
fi
