sudo apt update

sudo apt -y upgrade

sudo apt install -y python3-pip

sudo apt install -y build-essential libssl-dev 

sudo apt install -y make build-essential libssl-dev libffi-dev python-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git

curl https://pyenv.run | bash

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

