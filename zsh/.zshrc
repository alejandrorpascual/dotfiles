
#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
#### END FIG ENV VARIABLES ####
export PATH="/opt/homebrew/bin:$PATH"
export PATH="~/scripts:$PATH"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
plugins=(git)
source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"
# I you come from bash you might have to change your $PATH.
#
# export PATH=/Users/alejandrorpascual/.local/bin
export PATH=/usr/local/bin:/usr/local/sbin:${PATH}
export PATH=$PATH:~/.local/bin
export PATH=$PATH:/Users/alejandrorpascual/.local/share/bob/nvim-bin
# export PATH=$PATH:/usr/local/Cellar/theme-check/1.9.0/bin/theme-check-language-server
export HISTCONTROL=ignoredups


export DOTFILES="$HOME/dotfiles"


# make node_modules available in PATH
PATH="/usr/local/bin:$PATH:./node_modules/.bin"

alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'

export GOPATH=$(go env GOPATH)
export GOBIN=$GOPATH/bin

export PATH=$HOME/.local/bin:$PATH
export PATH=$GOBIN:$PATH

export PATH=:~/.config/composer/vendor/bin:$PATH

# Lua runtime for server
export PATH="$HOME/tools/lua-language-server/bin/macOS:$PATH"
export PIP2EVAL_TMP_FILE_PATH=/tmp/shms

export XDG_CONFIG_HOME=$HOME/.config
# export PATH=$PATH:/usr/local/anaconda3/bin

export N_PRESERVE_NPM=1

DEFAULT_USER=$(whoami)
# Path to your oh-my-zsh installation.
# export ZSH="/Users/alejandrorpascual/.oh-my-zsh"

# export TERM="xterm-256color"
# export TERM="alacritty-direct"

# colorize man pages
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANPAGER='nvim +Man!'

# RUPA/z
# . $HOME/z-master/z.sh

# Zoxide
eval "$(zoxide init zsh)"

export NERDIFY_TODO="$HOME/personal-projects/nerdify/final/nerdify3/todo.ignored.md"
#
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="gruvbox"
# SOLARIZED_THEME="dark"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
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
# DISABLE_MAGIC_FUNCTIONS=true

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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# source $ZSH/oh-my-zsh.sh

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

# SET VOLTA
#

CDPATH=$HOME
CDPATH=$CDPATH:$HOME/tmp
CDPATH=$CDPATH:$HOME/learn-go
CDPATH=$CDPATH:$HOME/learn-rust
CDPATH=$CDPATH:$HOME/learn-docker
CDPATH=$CDPATH:$DOTFILES/nvim/.config/nvim/

CDPATH=$CDPATH:..

alias -g dirs="dirs -v"
alias pd="pushd"
alias po="popd"

# alias -g rm='rm -i'
alias -g gnp="git --no-pager"
alias -g ggh="git log --graph --oneline"
alias -g gop="git-open"
alias -g zsrc="source ~/.zshrc"
alias -g vrc="nvim ~/.vimrc"
alias -g nzrc="nvim ~/.zshrc"
alias -g nvrc="nvim ~/.vimrc"
alias -g pip="pip3"
alias -g regexref="perldoc perlreref"
alias -g exerconf="vim /Users/alejandrorpascual/.config/exercism"
alias -g cvenv="~/svenv.sh"
alias -g st="speed-test"
alias -g sc="mit-scheme"
alias -g simply="stk-simply"
alias -g vp="vim $HOME/.prettierrc"
alias cat="bat --theme=\$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo Nord || echo GitHub)"
alias -g ls="exa"
alias -g eslint_conf="./node_modules/.bin/eslint --init"
alias -g tryjava="code $HOME/learn-java/try-things"
alias -g trypy="code $HOME/learn-python/try-things"
alias -g exsubmit="exercism submit"
alias -g npw="npm run watch"
alias -g cnpm="code . && npm i"
alias -g trc="vim $HOME/.tmux.conf"
alias -g ntrc="nvim $HOME/.tmux.conf"
# alias tmux="TERM=screen-256color-bce tmux"
alias -g srct="tmux source-file ~/.tmux.conf"
alias -g tm="tmux"
alias -g ta="tmux a -t"
alias -g tls="tmux list-sessions"
alias -g tn="tmux new -t"
alias -g Z='| fzf' # change Z to whatever you like
alias -g startmongo='brew services start mongodb-community@4.4'
alias -g stopmongo='brew services stop mongodb-community@4.4'
alias -g rp='realpath'
alias -g gcfgl="git config --global -e"
alias -g gdtool="git difftool"
alias -g gdtools="git difftool --staged"
alias -g nvf='nvim `fzf`'
alias -g az="alias Z"
alias -g grep_branches="git branch -a | tr -d \* | sed '/->/d' | xargs git grep"
# alias -g grep_branches ="'git grep "$0" "$@" "$(git for-each-ref --format=\"%(refname)\"" refs/)'"
alias -g npxr="npx create-react-app"
alias -g ntl="netlify"
alias -g nv="nvim ."
alias -g nrd="npm run dev"
alias -g nprmd="npx prisma migrage --dev"
alias -g nprs="npx prisma studio"
alias -g pa="php artisan"
alias -g pam="php artisan migrate"
alias -g mfs="php artisan migrate:fresh --seed"
alias -g pamf="php artisan migrate:fresh"
alias -g pamr="php artisan migrate:rollback"
alias -g pamc="php artisan make:controller"
alias -g pamm="php artisan make:middleware"
alias -g parl="php artisan route:list"
alias -g pat="php artisan tinker"
alias -g palm="php artisan livewire:make"
alias -g pamco="php artisan make:component"
alias -g pn="pnpm"
alias -g l="ls --long --header --icons --git --all"
alias -g dub="docker-compose up --build"
alias -g dud="docker-compose up -d"
alias -g dup="docker-compose up"

set -o vi

#haskell-stuff
export hsf="$HOME/haskell-stuff"    
#get programming with haskell
export gph="$hsf/get-programming-with-haskell"
#haskell wiki-book
export hwb="$hsf/wiki-book"


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export fmcss="$HOME/frontend-masters/css-in-depth-v3"
export fem="$HOME/frontend-masters"
export scripts="$HOME/scripts"
export fpjs="$HOME/hardcore-functional-prog/mostly-adequate"
export pyalg="$HOME/python/algorithms"
export eslintFile="$HOME/eslint-config/simple-eslint/.eslintrc"
export EXERCISM_WOSKPACE="$HOME/Exercism"
export ljv="$HOME/learn-java"
export java_algs="$HOME/learn-java/algs-4th/algs4/src/main/java/edu/princeton/cs/algs4"
export mjv="$HOME/learn-java/modern-java-in-action"
export lpy="$HOME/learn-python"
export pycs="$HOME/learn-python/classic-csprobs-python"
export edu="$HOME/algorithms_data_structures/educative"
export algs="$HOME/algorithms_data_structures"
export jsinter="$HOME/javascript/interviewing"
export vimtips="$HOME/vim/useful_tricks.txt"
export tips="$HOME/tips"
export npalette="$HOME/night_owl_color_palette.txt"
export tmuxrc="$HOME/.tmux.conf"
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export tmuxtips="$HOME/tmux_tips.txt"
export prettierconf="$HOME/.prettierrc"
export app_ideas="$HOME/app_ideas.txt"
export blog_ideas="$HOME/blog_ideas.txt"
export TLS="$HOME/TRACKLISTS"
export NTSTRACKS="$HOME/TRACKLISTS/NTS"
export SYSTEMTIPS="$HOME/general-commands/system.txt"
export rlist="$HOME/reading-list.md"
export pending="$HOME/todo-list/pending/to-read.md"
export build_modern="$HOME/build-modern-apps/nextjs/command.txt"
export nvim_plugins="/Users/alejandrorpascual/.local/share/nvim/site/pack/packer/start"
export EDITOR="nvim"
export VISUAL="nvim"
export twitter_vids="$HOME/Downloads/twitter-vids"
export yt_tracks="$HOME/Downloads/tracks"

# BOILERPLATES
export BOILERPLATES="$HOME/boilerplates"
export next_scripts="$HOME/boilerplates/nextjs/scripts.txt"
export next_index="$HOME/boilerplates/nextjs/home-page.txt"
export next_tsconfig="$HOME/boilerplates/nextjs/tsconfig.txt"


function ytdv() {
  echo "downloading video..." && yt-dlp "$1" --split-chapters -f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4] / bv*+ba/b" -P "~/Downloads/Courses/yt-courses/" -o "chapter:%(channel)s/%(title)s/%(section_number)03d - %(section_title)s.%(ext)s"
}

function twdv() { 
  echo "downloading twitter video" && yt-dlp "$(pbpaste)" -f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4] / bv*+ba/b" -o "~/Downloads/twitter-vids/%(title)s.%(ext)s"

}

function mdgo() {
  mkdir -p "$1" && cd $_
}

function mdtch() {
  mkdir -p "$1" && touch "$1"/"$2"
}

function scratch() {
  mkdir -p "$1" && touch "$1"/solution.py "$1"/scratchpad.py
}

function lcToVim() {
  fc -ln -1 > "$1".txt && vim "$1".txt && rm -rf "$1".txt
}

function modinit() {
  npm init -y && vim package.json
}

function npi() {
  npm init -y && mkdir -p ./node_modules && touch ./node_modules/.metadata_never_index
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# source ~/powerlevel10k/powerlevel10k.zsh-theme
# [ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



# export NVM_DIR="$HOME/.config/nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=/Users/alejandrorpascual/.local/bin/cabal:${PATH}

#.# Better Git Logs.
### Using EMOJI-LOG (https://github.com/ahmadawais/Emoji-Log).




function quick_clone () {
  git clone $1 && 
  cd "$(basename "$_" .git)" && 
}

function lr() {
  laravel new $1 --git --branch="main" && cd $1
}

function gcl_nvim() {
  quick_clone $1 &&
  npm i && 
  nvim .
}

function cdsplit() {
  cd $1 && tmux split-window && tmux resize-pane -D 8
}

# GIT IGNORE!
function gi() { curl -L -s https://www.gitignore.io/api/"$@" > .gitignore }

function jstots() {
  find $1 -name "*.js" -exec sh -c 'mv "$0" "${0%.js}.ts"' {} \;
}

# Git Commit, Add all and Push — in one step.
function gcap() {
    git add . && git commit -m "$*" && git push
}

function gcamsg() {
    git add . && git commit -m "$*"
}

function wip() { gcamsg "wip" }

function gamsg() {
    git add $1 && git commit -m "${@:2}"
}

# NEW.
function gnew() {
    gcap "📦 NEW: $@"
}

# IMPROVE.
function gimp() {
    gcap "👌 IMPROVE: $@"
}

# FIX.
function gfix() {
    gcap "🐛 FIX: $@"
}

# RELEASE.
function grlz() {
    gcap "🚀 RELEASE: $@"
}

# DOC.
function gdoc() {
    gcap "📖 DOC: $@"
}

# TEST.
function gtst() {
    gcap "🤖 TEST: $@"
}

# BREAKING CHANGE.
function gbrk() {
    gcap "‼️ BREAKING: $@"
}

function camelcase() {
    perl -pe 's#(_|^)(.)#\u$2#g'
}

function cheat { curl cheat.sh/$1; }

function envs() {
  ps eww -o command | tr ' ' '\n'
}

function csjq() {
  curl -s $1 | jq
}

function csjqvim() {
  csjq $1 | nvim -R -c 'set ft=json'
}

# Change cursor shape for different vi modes.
# function zle-keymap-select {
#   if [[ ${KEYMAP} == vicmd ]] ||
#      [[ $1 = 'block' ]]; then
#     echo -ne '\e[1 q'
#   elif [[ ${KEYMAP} == main ]] ||
#        [[ ${KEYMAP} == viins ]] ||
#        [[ ${KEYMAP} = '' ]] ||
#        [[ $1 = 'beam' ]]; then
#     echo -ne '\e[5 q'
#   fi
# }
# zle -N zle-keymap-select
# zle-line-init() {
#     zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#     echo -ne "\e[5 q"
# }
# zle -N zle-line-init
# echo -ne '\e[5 q' # Use beam shape cursor on startup.
# preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
# export ANDROID_SDK=/Users/alejandrorpascual/Library/Android/sdk
# export PATH=/Users/alejandrorpascual/Library/Android/sdk/platform-tools:$PATH

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"


# if [[ "$(defaults read -g AppleInterfaceStyle 2>/dev/null)" == "Dark" ]]; then
#     export TERMCS="dark"
# else
#     export TERMCS="light"
# fi


# alias luamake=/Users/alejandrorpascual/.config/nvim/lang-server/3rd/luamake/luamake
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
# export NODE_PATH="$VOLTA_HOME/bin/node"


#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
# [ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####


# Install (one or multiple) selected application(s)
# using "brew search" as source input
# mnemonic [B]rew [I]nstall [P]ackage
bip() {
  local inst=$(brew search "$@" | fzf -m)

  if [[ $inst ]]; then
    for prog in $(echo $inst);
    do; brew install $prog; done;
  fi
}
# Update (one or multiple) selected application(s)
# mnemonic [B]rew [U]pdate [P]ackage
bup() {
  local upd=$(brew leaves | fzf -m)

  if [[ $upd ]]; then
    for prog in $(echo $upd);
    do; brew upgrade $prog; done;
  fi
}
# Delete (one or multiple) selected application(s)
# mnemonic [B]rew [C]lean [P]ackage (e.g. uninstall)
bcp() {
  local uninst=$(brew leaves | fzf -m)

  if [[ $uninst ]]; then
    for prog in $(echo $uninst);
    do; brew uninstall $prog; done;
  fi
}

# Install or open the webpage for the selected application 
# using brew cask search as input source
# and display a info quickview window for the currently marked application 
binstall() {
    local token
    token=$(brew search --casks "$1" | fzf-tmux --query="$1" +m --preview 'brew info {}')
                    
    if [ "x$token" != "x" ]                                                                
    then             
        echo "(I)nstall or open the (h)omepage of $token"
        read input                             
        if [ $input = "i" ] || [ $input = "I" ]; then    
            brew install --cask $token                   
        fi                                                                                    
        if [ $input = "h" ] || [ $input = "H" ]; then                                         
            brew home $token                     
        fi                                           
    fi                             
}                                              
# Uninstall or open the webpage for the selected application 
# using brew list as input source (all brew cask installed applications) 
# and display a info quickview window for the currently marked application
buninstall() {                                                                     
    local token                                                                   
    token=$(brew list --casks | fzf-tmux --query="$1" +m --preview 'brew info {}')
                                                                                  
    if [ "x$token" != "x" ]                                                       
    then                                                                          
        echo "(U)ninstall or open the (h)omepae of $token"                        
        read input                                                                
        if [ $input = "u" ] || [ $input = "U" ]; then                             
            brew uninstall --cask $token                                          
        fi                                                                        
        if [ $input = "h" ] || [ $token = "h" ]; then                             
            brew home $token                                                      
        fi                                                                        
    fi                                                                            
}

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

lvn() { 
  laravel new $1 --git --branch="main" && cd $1
}

pamk() {
  php artisan make:$1 ${@:2}
}

# bun completions
[ -s "/Users/alejandrorpascual/.bun/_bun" ] && source "/Users/alejandrorpascual/.bun/_bun"

# Bun
export BUN_INSTALL="/Users/alejandrorpascual/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/usr/local/n/versions/node/16.19.0/bin/node:$PATH"

rgaf() {
	RG_PREFIX="rga --files-with-matches"
	local file
	file="$(
		FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
			fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
				--phony -q "$1" \
				--bind "change:reload:$RG_PREFIX {q}" \
				--preview-window="70%:wrap"
	)" &&
	echo "opening $file" &&
	open "$file"
}

function bat_lite() { 
    export BAT_THEME="GitHub"
}

function bat_dark() { 
        export BAT_THEME="OneHalfDark"
}

# pnpm
export PNPM_HOME="/Users/alejandrorpascual/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
#

# is_system_appearence_dark() {
# 	if [ "Dark" = "$(defaults read -g AppleInterfaceStyle 2> /dev/null)" ]; then
# 		return 0
# 	else
# 		return 1
# 	fi
# }

# if command kitty exists
# if command -v kitty &> /dev/null; then
#     if is_system_appearence_dark; then
#         kitty +kitten themes Nightfox
#     else
#         kitty +kitten themes Catppuccin-Latte
#     fi
# fi

#
function tlw() { 
        if [ "$TERM_PROGRAM" = "tmux" ]; then
                tmux switchc -t $(tmux list-sessions | fzf | sed -E 's/:.+//')
        else
                ta $(tls | fzf | sed -E 's/:.+//')
        fi
}

function gdl () { 
        bat_lite && git diff
}

function gdd () { 
        bat_dark && git diff
}

function take() { 
        mkdir -p $@ && cd ${@:$#}
}



fpath=($HOME/.zsh/zsh-completions/src $fpath)
source ~/.zsh/zsh-completions/zsh-completions.plugin.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
 source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

bindkey '^ ' autosuggest-accept
alias lzd='docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v /Users/alejandrorpascual/dotfiles/lazydocker/.config/lazydocker:/.config/jesseduffield/lazydocker lazyteam/lazydocker'
alias spt='speedtest'

source ~/tmp/zshenv


# add rfv to path
export PATH="$PATH:$HOME/scripts"

function stack-p() {
        yabai -m config top_padding 80
        yabai -m config left_padding 256
        yabai -m config right_padding 256
        yabai -m config bottom_padding 80
}

function stack-n() {
    local padding=${1:-12}

    yabai -m config top_padding $padding
    yabai -m config bottom_padding $padding
    yabai -m config left_padding $padding
    yabai -m config right_padding $padding
}

export PATH="/opt/homebrew/opt/python@3.11/libexec/bin:$PATH"

export JUPYTER_PATH=/opt/homebrew/share/jupyter 
export JUPYTER_CONFIG_PATH=/opt/homebrew/etc/jupyter

export SHELLBOT=$HOME/.local/share/nvim/lazy/shellbot/target/release/shellbot
export SHELLBOT_PROMPT='
  You are a helpful assistant who provides brief explanations and short code
  snippets for technologies like TypeScript, JavaScript, Rust, Ruby, Ruby on
  Rails, HTML, CSS, Zsh, Go, Lua, and Sorbet. Your user is an expert programmer,
  so you should be as concise as possible. You do not show lengthy steps or
  setup instructions. Questions will be asked using Markdown, and you should
  feel free to use Markdown syntax in your replies.
'
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
