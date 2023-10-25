#!/bin/bash
sudo apt install figlet
figlet Setup menu

autoinstall=false
if [[ $1 == [-][yY] || $1 == [-][yY][eE][sS] ]]; then
  autoinstall=true
fi

if [ $autoinstall = false ]; then
  read -p "Install Python 3.11? (Y/N): " answer
fi

if [[ $autoinstall = true || $answer == [yY] || $answer == [yY][eE][sS] ]]; then
  echo "Setting up python 3.11 for you..."
  # PYTHON 3.11 install

  curl https://pyenv.run | bash
  echo 'export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

  sudo apt-get install --yes libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libgdbm-dev lzma lzma-dev tcl-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev wget curl make build-essential openssl

  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"

  pyenv update
  pyenv install 3.11
  pyenv global 3.11
fi

if [ $autoinstall = false ]; then
  read -p "Install Docker and Docker-Compose? (Y/N): " answer
fi

if [[ $autoinstall = true || $answer == [yY] || $answer == [yY][eE][sS] ]]; then
  echo "Setting up docker and docker-compose for you..."
  # docker & docker-compose install
  curl -fsSL https://get.docker.com | sh
fi

echo 'Type "exec $SHELL" to refresh the shell and then "python --version" to check your python installation'
echo 'Type "docker compose up" to bring up your stack'
figlet See ya $(hostname)