#!/bin/bash

# Update apt-get
sudo apt-get update

# Install git
sudo apt-get install git

# Install Python build dependencies for Ubuntu
sudo apt-get install make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# Install anyenv for pyenv & nodenv
git clone https://github.com/anyenv/anyenv ~/.anyenv
echo '' >> ~/.profile
echo '# anyenv' >> ~/.profile
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.profile
~/.anyenv/bin/anyenv init
echo 'eval "$(anyenv init -)"' >> ~/.profile
source ~/.profile
anyenv install --init
anyenv -v
# pyenv
anyenv install pyenv
pyenv -v
pyenv install 3.8.3
pyenv global 3.8.3
pyenv version
# nodenv
anyenv install nodenv
nodenv -v
nodenv install 14.3.0
nodenv global 14.3.0
nodenv version

# Install Pipenv
pip install pipenv
echo '' >> ~/.profile
echo '# pipenv' >> ~/.profile
echo 'export PIPENV_VENV_IN_PROJECT=1' >> ~/.profile
source ~/.profile
pipenv --version

# Install yarn
npm install --global yarn
echo '' >> ~/.profile
echo '# yarn' >> ~/.profile
echo 'PATH="$HOME/.yarn/bin:$PATH"' >> ~/.profile
source ~/.profile
yarn -v

# Install Vue.js
yarn global add @vue/cli
rm -rf node_modules package-lock.json && npm install

# Clone my GitHub repository & Create pipenv environment
git clone git@github.com:rita-rita-ritan/PixivQuiz.git
cd PixivQuiz/PixivQuiz/backend
pipenv sync
cd ~

# sshdまわりも必要かも？