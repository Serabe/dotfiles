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
zplug 'plugins/atom', as:plugin, from:oh-my-zsh
zplug 'plugins/bower', as:plugin, from:oh-my-zsh
zplug 'plugins/brew', as:plugin, from:oh-my-zsh
zplug 'plugins/bundler', as:plugin, from:oh-my-zsh
zplug 'plugins/capistrano', as:plugin, from:oh-my-zsh
zplug 'plugins/cp', as:plugin, from:oh-my-zsh
zplug 'plugins/dotenv', as:plugin, from:oh-my-zsh
zplug 'plugins/fancy-ctrl-z', as:plugin, from:oh-my-zsh
zplug 'plugins/gem', as:plugin, from:oh-my-zsh
zplug 'plugins/git', as:plugin, from:oh-my-zsh
zplug 'plugins/git-flow', as:plugin, from:oh-my-zsh
zplug 'plugins/gitignore', as:plugin, from:oh-my-zsh
zplug 'plugins/golang', as:plugin, from:oh-my-zsh
zplug 'plugins/lein', as:plugin, from:oh-my-zsh
zplug 'plugins/marked2', as:plugin, from:oh-my-zsh
zplug 'plugins/npm', as:plugin, from:oh-my-zsh
zplug 'plugins/osx', as:plugin, from:oh-my-zsh
zplug 'plugins/postgres', as:plugin, from:oh-my-zsh
zplug 'plugins/rails', as:plugin, from:oh-my-zsh
zplug 'plugins/rvm', as:plugin, from:oh-my-zsh
zplug 'plugins/sublime', as:plugin, from:oh-my-zsh

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
