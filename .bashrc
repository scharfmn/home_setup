# Prompt
# http://engineerwithoutacause.com/show-current-virtualenv-on-bash-prompt.html

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
  UC=$WHITE
  LC=$CYAN
  HD=$FULL

  # Prompt function because PROMPT_COMMAND is awesome
  function set_prompt() {
      # show the host only and be done with it.
      #host="${UC}${HD}${NIL}"
      host="${LC}${NIL}"
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
      myuser="${UC}\u${NIL}"

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
             venv=" ${YELLOW}{${VIRTUAL_ENV##*/}}"
      else
         venv=''
      fi

      export PS1="${host} ${myuser}${path}${venv}${branch} ${end}"
  }

  export PROMPT_COMMAND=set_prompt



# Sublime

  export GIT_EDITOR="subl --wait --new-window"

  alias subl="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'"
  alias nano="subl"
  export EDITOR="subl"


# Pyenv

export WORKON_HOME=~/.mns_envs
export PROJECT_HOME=~/Mike/scharfmn
eval "$(pyenv init -)"
pyenv virtualenvwrapper_lazy


export PYENV_VIRTUALENV_DISABLE_PROMPT=1

export FLASK_APP='app.py'


