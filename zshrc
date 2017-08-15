# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
if [ $TERM_PROGRAM = "Hyper" ]; then
    ZSH_THEME="hyperzsh"
else
    ZSH_THEME="spaceship"
fi

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(atom bower brew bundler capistrano cp dotenv elixir fancy-ctrl-z gem git git-flow gitignore golang lein marked2 npm osx postgres rails rvm sublime)

source $ZSH/oh-my-zsh.sh

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

# Go settings
export GOPATH=$HOME/Go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

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

# Check PRs
alias git-pr='f() { git fetch upstream && git checkout pr/"$1" && npm install && grunt init && npm start; }; f'

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
alias gwip='git add -A && git commit -m "WIP [skip ci]"'


source "/Users/serabe/.oh-my-zsh/custom/themes/spaceship.zsh-theme"

# SPACESHIP CONFIG
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
