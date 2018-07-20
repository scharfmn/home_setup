# install Homebrew

brew install pyenv
brew install pyenv-virtualenv
brew install pyenv-virtualenvwrapper

mkdir ~/.mns_envs
mkdir ~/Mike/scharfmn/

# add to .bashrc and uncomment first order of comments:

#export WORKON_HOME=~/.mns_envs
#export PROJECT_HOME=~/Mike/scharfmn
#eval "$(pyenv init -)"
##pyenv virtualenvwrapper_lazy


# See https://www.python.org/getit/ for versions available
#pyenv install 3.7.0
pyenv install 3.6.6
pyenv install 2.7.15

pyenv virtualenv 3.6.6 jupyter36
pyenv virtualenv 3.6.6 tools
pyenv virtualenv 2.7.15 ipython2

# Jupyter notebook with default for 3.6
pyenv activate jupyter36
pip install jupyter
python -m ipykernel install --user
pyenv deactivate

# Kernel of 2.7.15 for Jupyter 
pyenv activate ipython2
pip install ipykernel
python -m ipykernel install --user
pyenv deactivate

# Non-dev tools 
# pyenv activate tools
# pip install youtube-dl
# pyenv deactivate

pyenv global 3.6.6 2.7.15 jupyter36 ipython2 tools

# Now uncomment the line #pyenv virtualenvwrapper_lazy on your ~/.bashrc 

ipython profile create
curl -L http://hbn.link/hb-ipython-startup-script > ~/.ipython/profile_default/startup/00-venv-sitepackages.py





