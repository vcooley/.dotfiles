# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git 1password)

source $ZSH/oh-my-zsh.sh

# User configuration

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
alias dbchrome='open -n -a "Google Chrome" "http://localhost:8000" --args --profile=debug-profile --user-data-dir=$HOME/.config/chrome-debug-profile --remote-debugging-port=9222 --window-name=DEBUG'
alias tp='tesorio podman'
alias tp='tesorio podman'
alias tpsd='tesorio podman start dashboard'
alias tpsa='tesorio podman start automations'
alias tppd='tesorio podman stop dashboard'
alias tppa='tesorio podman stop automations'

# cd to the project in a subshell to reduce noise and reduce search results from other projects in the repo
alias nvd='(cd $HOME/Projects/Dashboard/assets/dashboard; nvim .)'
alias nvp='(cd $HOME/Projects/Dashboard/assets/pay; nvim .)'
alias nvD='(cd $HOME/Projects/Dashboard/; nvim .)'
alias nvgf='nvim $(git ls-files -o -m --exclude-standard)'

# QMK keyboard/keymap management
# Uses my fork of QMK firmware 
KEYBOARD='handwired/dactyl_manuform/vcooley/5x7'
# Uses my external userspace fork via https://github.com/getreuer/qmk-keymap
KEYMAP='vcooley'
QMK_USERSPACE="$HOME/Projects/qmk_userspace/"
KEYMAP_LOCATION="$QMK_USERSPACE/keyboards/$KEYBOARD/keymaps/$KEYMAP"
# [K]ey[b]oard [c]ompile
alias kbc="qmk compile -kb $KEYBOARD -km $KEYMAP"
# [K]ey[b]oard [e]dit
alias kbe="(cd $QMK_USERSPACE; $EDITOR $KEYMAP_LOCATION)"

# dotfile management assumes a bare git repo in the $HOME/$DOTFILES dir with a working tree of $HOME
DOTFILES=".dotfiles"
alias config='/usr/bin/git --git-dir=$HOME/$DOTFILES/ --work-tree=$HOME'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Created by `pipx` on 2024-03-03 17:28:24
export PATH="$PATH:$HOME/.local/bin"

export PATH="$PATH:/usr/local/bin/zig/"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

eval "$(/opt/homebrew/bin/brew shellenv)"

# Added by Windsurf
export PATH="/Users/vince/.codeium/windsurf/bin:$PATH"
