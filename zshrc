# zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

if [ $TERM_PROGRAM = "Hyper" ]; then
    ZSH_THEME="hyperzsh"
else
    # Spaceship theme
    zplug 'denysdovhan/spaceship-zsh-theme', use:spaceship.zsh, from:github, as:theme
fi

zplug zsh-users/zsh-syntax-highlighting
zplug zsh-users/zsh-completions

# Elixir plugin
zplug 'gusaiani/elixir-oh-my-zsh', as:plugin, from:github, use:elixir.plugin.zsh

# oh-my-zsh plugins
zplug 'lib/completion', as:plugin, from:oh-my-zsh
zplug 'lib/key-bindings', as:plugin, from:oh-my-zsh
zplug 'lib/nvm', as:plugin, from:oh-my-zsh
zplug 'lib/theme-and-appearance', as:plugin, from:oh-my-zsh
zplug 'plugins/brew', as:plugin, from:oh-my-zsh
zplug 'vasyharan/zsh-brew-services', as:plugin
zplug 'plugins/bundler', as:plugin, from:oh-my-zsh
zplug 'plugins/cp', as:plugin, from:oh-my-zsh
zplug 'plugins/dotenv', as:plugin, from:oh-my-zsh
zplug 'plugins/fancy-ctrl-z', as:plugin, from:oh-my-zsh
zplug 'plugins/gem', as:plugin, from:oh-my-zsh
zplug 'plugins/git', as:plugin, from:oh-my-zsh
zplug 'plugins/gitignore', as:plugin, from:oh-my-zsh
zplug 'plugins/golang', as:plugin, from:oh-my-zsh
zplug 'plugins/marked2', as:plugin, from:oh-my-zsh
zplug 'plugins/npm', as:plugin, from:oh-my-zsh
zplug 'plugins/osx', as:plugin, from:oh-my-zsh
zplug 'plugins/postgres', as:plugin, from:oh-my-zsh
#zplug 'plugins/rails', as:plugin, from:oh-my-zsh
zplug 'plugins/rvm', as:plugin, from:oh-my-zsh
zplug 'plugins/sublime', as:plugin, from:oh-my-zsh
zplug 'plugins/yarn', as:plugin, from:oh-my-zsh

zplug 'caarlos0/zsh-pg', as:plugin
zplug "MichaelAquilina/zsh-you-should-use"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# User configuration

export PATH="$HOME/.bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# Ember CLI
alias e=ember
alias efsa="ember fastboot --serve-assets"
alias eg="ember g"
alias es="ember s"
alias ets="ember test --server"

# Launch nwjs
alias nwjs=/Applications/nwjs.app/Contents/MacOS/nwjs

# no sleep
alias nosleep='pmset noidle'

# list symlinks
alias symlinks='ls -l `find . -type l -print `'

# go up two dirs
alias ...=../..

# Fuzzy branch search
fbr() {
    local branches branch
    branches=$(git branch -a) &&
    branch=$(echo "$branches" | fzf +s +m -e) &&
    git checkout $(echo "$branch" | sed "s:.* remotes/origin/::" | sed "s:.* ::")
}

# Mackup
export MACKUP_CONFIG_FILE=~/.mackup-config-file

# Set LC_ALL and LANG
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

. `brew --prefix`/etc/profile.d/z.sh

# NVM configuration
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# The fuck
eval "$(thefuck --alias)"

# Kiex
test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"

# Rails alias
alias rcs="rails console --sandbox"

# Find BOM
alias find_bom="grep -rl $'\xEF\xBB\xBF' ."

# Go
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/serabe/Downloads/google-cloud-sdk/path.zsh.inc ]; then
  source '/Users/serabe/Downloads/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/serabe/Downloads/google-cloud-sdk/completion.zsh.inc ]; then
  source '/Users/serabe/Downloads/google-cloud-sdk/completion.zsh.inc'
fi

# Use nvim by default
alias ovim=$(~/.bin/find_path vim)
alias vim=nvim

# Easy PR
alias gpr='f() { git fetch upstream && git checkout pr/"$1"; }; f'

# Easy WIP
alias gwip='git add -A && git commit -m "WIP [skip ci]" --no-verify'

# SPACESHIP CONFIG
SPACESHIP_PROMPT_ORDER=(
  time          # Time stampts section
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
#  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
#  xcode         # Xcode section
#  swift         # Swift section
#  golang        # Go section
#  php           # PHP section
  rust          # Rust section
#  haskell       # Haskell Stack section
#  julia         # Julia section
#  docker        # Docker section
#  aws           # Amazon Web Services section
#  venv          # virtualenv section
#  conda         # conda virtualenv section
#  pyenv         # Pyenv section
#  dotnet        # .NET section
  ember         # Ember.js section
#  kubecontext   # Kubectl context section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Backgound jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_TIME_SHOW=true
SPACESHIP_HG_SHOW=false
SPACESHIP_HG_BRANCH_SHOW=false
SPACESHIP_HG_STATUS_SHOW=false
SPACESHIP_XCODE_SHOW_LOCAL=false
SPACESHIP_SWIFT_SHOW_LOCAL=false
SPACESHIP_PHP_SHOW=false
SPACESHIP_HASKELL_SHOW=false
SPACESHIP_JULIA_SHOW=false
SPACESHIP_AWS_SHOW=false
SPACESHIP_VENV_SHOW=false
SPACESHIP_PYENV_SHOW=false
SPACESHIP_DOTNET_SHOW=false
SPACESHIP_KUBECONTEXT_SHOW=false
SPACESHIP_BATTERY_CHARGED_SHOW=low
SPACESHIP_BATTERY_THRESHOLD="40"

# New ulimit
ulimit -S -n 2048

# Taken from
# https://dockyard.com/blog/2018/05/11/tell-me-when-it-s-finished
#
# Usage:
# - with args, `judge mix test`; runs `yay` or `boom`
#   depending on exit status of given command
# - without args, `mix test; judge`; runs `yay` or `boom`
#   depending on exit status of previous command
function judge() {
  last_exit_status=$?
  number_of_args=$#
  if [ $number_of_args -gt 0 ]
  then
    # - treat the args as a command to run
    # - $@ is all the args given
    # - `"$@"` makes sure that quoting is preserved;
    #     eg, if the command was `judge echo one "two three"`,
    #     `echo` will get two args, not three
    # - Once the expansion is done, the shell sees a bare
    #   command and runs it.
    "$@" && yay || boom
  else
    # No args given means no command to run, so check the exit
    # status of the last command and notify accordingly
    [ $last_exit_status -eq 0 ] && yay || boom
  fi
}

function killport() {
    kill `sudo lsof -t -i:$1`
}

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

alias nombom='rm -rf node_modules && npm install && echo "(╯°□°）╯︵ ┻━┻"'
