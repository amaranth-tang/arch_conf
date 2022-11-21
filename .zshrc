# ZSH
export ZSH=/usr/share/oh-my-zsh
export ZSH_CUSTOM="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
DISABLE_AUTO_UPDATE="true"
plugins=(git vi-mode cp z extract)
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi
ZSH_THEME="gruvbox-dark"

source $ZSH/oh-my-zsh.sh


HIST_STAMPS="yyyy-mm-dd" 

# enable autocompletion
autoload -Uz compinit
compinit

# enable autocompletion with an arrow-key driven interface
zstyle ':completion:*' menu select

# enable autocompletion of command line switches for aliases
setopt COMPLETE_ALIASES

# enable autocompletion of privileged environments in privileged commands
zstyle ':completion::complete:*' gain-privileges 1

# enable history search
#autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
#zle -N up-line-or-beginning-search
#zle -N down-line-or-beginning-search
#
#[[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
#[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search

# autoload the prompt theme system
autoload -Uz promptinit
promptinit

# load prompt theme
#prompt adam2
#prompt clint
#prompt elite2

# auto reset the terminal
ttyctl -f

# zsh help command
#autoload -Uz run-help
#unalias run-help
#alias help=run-help

# Fish-like syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# rehash persistent
zstyle ':completion:*' rehash true

# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' \
         'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# setting up history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zhistory

# colored man pages
if [[ "$OSTYPE" = solaris* ]]
then
	if [[ ! -x "$HOME/bin/nroff" ]]
	then
		mkdir -p "$HOME/bin"
		cat > "$HOME/bin/nroff" <<EOF
#!/bin/sh
if [ -n "\$_NROFF_U" -a "\$1,\$2,\$3" = "-u0,-Tlp,-man" ]; then
	shift
	exec /usr/bin/nroff -u\$_NROFF_U "\$@"
fi
#-- Some other invocation of nroff
exec /usr/bin/nroff "\$@"
EOF
		chmod +x "$HOME/bin/nroff"
	fi
fi

function man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
		PAGER="${commands[less]:-$PAGER}" \
		_NROFF_U=1 \
		PATH="$HOME/bin:$PATH" \
			man "$@"
}


# environment variable
#export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/cuda/targets/x86_64-linux/lib"
export VISUAL=/usr/bin/vim
export EDITOR=/usr/bin/vim
#export CC=clang
export CC=gcc
export XDG_DATA_DIRS=/home/amaranth/.local/share:/other/things/in/path/share:/usr/local/share:/usr/share:/opt/cuda/share:/opt/cuda/nsight_compute/share:/opt/cuda/nsight_systems/share:/usr/bin/site_perl/share:/usr/bin/vendor_perl/share:/usr/bin/core_perl/share


#export CXX=clang++


setopt noclobber


# alias

# pacman tips and tricks

# list all installed packages and their individual sizes
pacloc() {pacman -Qi | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | sort -h}
# list package sizes with their dependencies
alias exdep="expac -H M '%m\t%n' | sort -h"
# list the 20 last installed packages
alias exlast="expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort | tail -n 20"
# browse all installed packages with an instant preview of each package
alias pacbro="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"


#alias ls='ls --color=auto'
#alias ll='ls -l'
#alias la='ls -lA'
alias ls='exa'
#alias ll='exa -IG --git --time-style=long-iso'
alias ll="exa -lbg --group-directories-first"
alias la='exa -abghHliS --group-directories-first'
alias tree='exa -T'

alias setproxy='export ALL_PROXY=socks5://127.0.0.1:1080'
alias unsetproxy='unset ALL_PROXY'


alias grep='grep --color=auto'
#alias aurman='proxychains4 aurman'
alias trizen='proxychains4 trizen'
alias grive='proxychains4 grive'
alias vi='vim'
alias nvi='nvim'
alias pc4='proxychains4'
alias wechat="google-chrome-stable --app='https://wx.qq.com'"
#alias qq="google-chrome-stable --app='https://web2.qq.com/'"
alias wifi="sudo wpa_supplicant -B -i wlp35s0f3u3 -c /etc/wpa_supplicant/wpa_supplicant.conf"
alias scp2v2ray="scp -i ~/.ssh/v2ray_ed25519 -P 29085"
alias scpipv62v2ray="scp -6 -i ~/.ssh/v2ray_ed25519 -P 29085"
alias dt="rm /home/amaranth/Downloads/*.torrent"

export RSYNC_PASSWORD=rsyncfile
alias rsyncdata="/usr/bin/rsync -vzrtopg --port=873 --progress --delete rsync://rsync@210.28.139.62/rsyncfile  /home/amaranth/DATA/rsync"

alias s='source ~/.zshrc && echo "source ~/.zshrc"'
alias c='clear'

alias winsrv1='rdesktop -a 16 -u tangwenjie -p 990124 210.28.136.38 -g 1920x1080 -x 0x80 -r sound:off -r disk:home=/home/NTFS'

#alias launchleagueoflegends='WINEPREFIX=/home/amaranth/.local/share/leagueoflegends/wine.win32 /opt/wine-lol/bin/wine Z:\\home\\amaranth\\.local\\share\\leagueoflegends\\LOL\\LeagueClient.exe'
#alias launchleagueoflegends='WINEPREFIX=/home/amaranth/.local/share/leagueoflegends/wine.win32 /opt/wine-lol/bin/wine Z:\\home\\amaranth\\.local\\share\\leagueoflegends\\Riot\ Games\\Riot\ Client\\RiotClientServices.exe --launch-product=league_of_legends --launch-patchline=live'


# hash
hash -d drive="/home/NTFS/Google-Drive"
hash -d arch="/home/NTFS/Arch-Backup"
hash -d pt="/home/NTFS/µTorrent/arch_rtorrent"
hash -d data="/home/amaranth/DATA/rsync"

hash -d work='/home/amaranth/DATA/paper/work1'


#pacman()
#{
#  if [ "$1" = "-Syu" ]
#  then
#    command sudo proxychains4 pacman -Syu
#  elif [ "$1" = "-S" ]
#  then
#    sudo proxychains4 pacman "$@"
#  elif [ "$1" = "-Si" ]
#  then
#    proxychains4 pacman "$@"
#  elif [ "$1" = "-Ss" ]
#  then
#    proxychains4 pacman "$@"
#  elif [ "$1" = "-Rns" ]
#  then
#    sudo pacman "$@"
#  else
#    command pacman "$@"
#  fi
#}
