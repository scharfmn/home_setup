# Everyone needs a little color in their lives
RED='\[\033[31m\]'
GREEN='\[\033[32m\]'
YELLOW='\[\033[33m\]'
BLUE='\[\033[34m\]'
PURPLE='\[\033[35m\]'
CYAN='\[\033[36m\]'
WHITE='\[\033[37m\]'
NIL='\[\033[00m\]'

# Hostname styles
FULL='\H'
SHORT='\h'

# System => color/hostname map:
# UC: username color
# LC: location/cwd color
# HD: hostname display (\h vs \H)
# Defaults:
UC=$GREEN
LC=$BLUE
HD=$FULL

# Prompt function because PROMPT_COMMAND is awesome
function set_prompt() {
    # show the host only and be done with it.
    #host="${UC}${HD}${NIL}"
    host="${LC}${HD}${NIL}"
    # Special vim-tab-like shortpath (~/folder/directory/foo => ~/f/d/foo)
    _pwd=`pwd | sed "s#$HOME#~#"`
    if [[ $_pwd == "~" ]]; then
       _dirname=$_pwd
    else
       _dirname=`dirname "$_pwd" `
        if [[ $_dirname == "/" ]]; then
              _dirname=""
        fi
       _dirname="$_dirname/`basename "$_pwd"`"
    fi
    path="${LC}${_dirname}${NIL}"
    myuser="${UC}\u@${NIL}"

    # Dirtiness from:
    # http://henrik.nyh.se/2008/12/git-dirty-prompt#comment-8325834
    if git update-index -q --refresh 2>/dev/null; git diff-index --quiet --cached HEAD --ignore-submodules -- 2>/dev/null && git diff-files --quiet --ignore-submodules 2>/dev/null
        then dirty=""
    else
       dirty="${RED}*${NIL}"
    fi
    _branch=$(git symbolic-ref HEAD 2>/dev/null)
    _branch=${_branch#refs/heads/} # apparently faster than sed
    branch="" # need this to clear it when we leave a repo
    if [[ -n $_branch ]]; then
       branch=" ${NIL}[${PURPLE}${_branch}${dirty}${NIL}]"
    fi

    # Dollar/pound sign
    end="${LC}\$${NIL} "

    # Virtual Env
    if [[ $VIRTUAL_ENV != "" ]]
       then
           venv=" ${RED}(${VIRTUAL_ENV##*/})"
    else
       venv=''
    fi

    export PS1="${host} ${myuser}${path}${venv}${branch} ${end}"
}

export PROMPT_COMMAND=set_prompt

#########

#ssh-add ~/.ssh/AWS.pem

#git="/usr/local/git/bin"

#brew="/usr/local/bin"

#epd="/Library/Frameworks/EPD64.framework/Versions/Current/bin"
#PATH=:"${epd2}:${git}:${PATH}"
#export PATH

#MKL_NUM_THREADS=8
#export MKL_NUM_THREADS

###export PATH=/Users/vgoklani/anaconda/bin:$PATH
#anaconda="/Users/Lakyrkhu/anaconda/bin"

#PATH=:"${anaconda}:${git}:${PATH}"
#export PATH
#export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
#PATH=:"${brew}:${PATH}"
#export PATH


# source .bash_profile
# which python
# echo $PATH

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

#export PYTHONPATH="/Users/vgoklani/metricle/src"
export GIT_EDITOR="subl --wait --new-window"
#export PATH='/usr/local/bin:$PATH'


PYTHONPATH="${PYTHONPATH}:/Users/Lakyrkhu/workspace/metricle/src"
export PYTHONPATH

# added by Anaconda 2.0.1 installer
export PATH="/opt/anaconda/anaconda/bin:$PATH"

# added by Anaconda 2.0.1 installer
export PATH="/opt/anaconda/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
source '/Users/mns/Downloads/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/Users/mns/Downloads/google-cloud-sdk/completion.bash.inc'

export LC_ALL="en_US.UTF-8"
