# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/joram/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(fzf-tab nix-shell zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# https://stackoverflow.com/a/58517668/9946744
autoload -Uz +X compinit && compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Aliases
alias v=nvim
alias ns=nix-shell
alias bat=batcat
alias cat=bat
alias fd=fdfind
alias docker='sudo docker'
alias docker-compose='sudo docker-compose'
eval $(thefuck --alias)

# from https://thoughtbot.com/upcase/videos/intro-to-dotfiles
# No arguments: `git status`
# With arguments: acts like `git`
g() {
	if [[ $# > 0 ]]; then
		git $@
	else
		git status
	fi
}

# Complete `g` like `git`
compdef g=git

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export FZF_DEFAULT_COMMAND="fdfind '--exclude={.git,.idea,.vscode,.sass-cache,node_modules,build,tmp,*.o}' --type f"
export FZF_DEFAULT_OPTS="--no-mouse"
export SPICETIFY_INSTALL="/home/joram/spicetify-cli"
export MANPAGER='nvim +Man!'
export MYSQL_PS1="\u@\h [\d]> "
export EDITOR='nvim'
export ANDROID_SDK_ROOT="/home/joram/Android/Sdk/"
export NIX_SHELL_PRESERVE_PROMPT=1
export SUDO_PROMPT=" password for %p: "

# Path stuff
PATH="$PATH:/home/joram/scripts/"
PATH=$PATH:/usr/local/go/bin
PATH="$PATH:/home/joram/Installers/processing-3.5.4/"
PATH="$PATH:/home/joram/bin"
PATH="$SPICETIFY_INSTALL:$PATH"
PATH="$PATH:/usr/share/texlive/"
PATH="$PATH:/home/joram/Android/Sdk/platform-tools/"
PATH="$PATH:/opt/mssql-tools/bin"

# Nix path
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}

# Customize fzf-tab
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -A --color=always $realpath'
zstyle ':fzf-tab:complete:nvim:*' fzf-preview 'batcat -p --color=always $realpath'

# Include hidden files in autocomplete
_comp_options+=(globdots)
zstyle ':completion:*' special-dirs false

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# source ~/.zsh-plugins/fzf-tab-completion/zsh/fzf-zsh-completion.sh
# bindkey '^I' fzf_completion

# zsh autosuggest settings
bindkey '^ ' autosuggest-accept
bindkey '\e[20;5~' autosuggest-execute

# shows if the directories in this directory are dirty git directories
git_dirty() {
	for dir in ./*/; do
		( cd "${dir%/*}" && echo "$dir (\e[90m$(git branch --show-current)\e[0m): $([[ $(git diff --stat) != '' ]] && echo "\e[31mdirty\n$(git status --short)" || echo "\e[32mclean")\e[0m" )
	done
}

# fh - repeat history
fh() {
	print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

function wallpaper() {
	feh --no-fehbg --bg-fill $1
}

source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
