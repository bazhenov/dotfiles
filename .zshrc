system_type=$(uname -s)

ZSH=$HOME/.oh-my-zsh

ZSH_COMPDUMP=$HOME/.zcompdump
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"

export LANG=en_US.UTF-8

plugins=(git osx brew colored-man-pages common-aliases docker autojump)

source $ZSH/oh-my-zsh.sh

if [ -d $HOME/bin ]; then
	export PATH=$HOME/bin:$PATH
fi

if [ -d $HOME/.cargo/bin ]; then
	export PATH=$HOME/.cargo/bin:$PATH
fi

if [ -x "$(command -v brew)" ]; then
	brew_prefix="$(brew --prefix)"
	export PATH=$PATH:$brew_prefix/sbin:$brew_prefix/bin
fi

if [ -x "$(command -v gpg)" ]; then
	export GPG_TTY=$(tty)
fi

if [ -x "$(command -v gls)" ]; then
	alias ls="gls --color=auto --group-directories-first"
fi

if [ -x "$(command -v exa)" ]; then
	alias l="exa --long --group-directories-first"
	alias lt="l -T -L=2"
fi

if [ -x "$(command -v kubectl)" ]; then
	alias kc="kubectl"
fi

if [ -d "$HOME/go" ]; then
	export GOPATH=$HOME/go
	export PATH=$PATH:$GOPATH/bin
fi

# Configuring Java
jhome="/usr/libexec/java_home"
if [[ -x $jhome ]] then
	export JAVA_HOME=`$jhome -v 1.8`
	export JAVA_TOOL_OPTIONS="-Dfile.encoding=utf8"
	export PATH=$PATH:$JAVA_HOME/bin
	alias java_home=$jhome
fi

export CDIFF_OPTIONS="-s -w 0"
export LESS="$LESS -i"

alias utf='iconv -f windows-1251 -t utf8'
alias notify='terminal-notifier -message "Your command is done sir" -title zsh -sound Glass'
alias dc='docker-compose'

if [ -x "$(command -v nvim)" ]; then
	export EDITOR=nvim
	alias v='nvim'
	alias vi='nvim'
	alias vim='nvim'
else
	export EDITOR=vim
fi

cdf () {
	currFolderPath=$( /usr/bin/osascript << EOT
	tell application "Finder"
		try
			set currFolder to (folder of the front window as alias)
		on error
			set currFolder to (path to desktop folder as alias)
		end try
		POSIX path of currFolder
	end tell
EOT
	)
	cd "$currFolderPath"
}

function gdiff() { git diff `git merge-base master $1`^1..$1 }

function locateRecent { mdfind 'kMDItemFSCreationDate >= $time.yesterday'; }

function docker-export() {
	alias $1="docker run -it --rm -w /opt -v \$PWD:/opt $2 $1"
}

function @!() {
	docker run -it --rm -w /pwd -v $(pwd):/pwd $1 ${@: 2}
}

function @() {
	docker run -it --rm $1 ${@: 2}
}

docker-export avr-gcc bazhenov/avr-toolchain
docker-export avr-objcopy bazhenov/avr-toolchain

alias docker-host="screen ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/tty"
unalias fd
[ -f ~/.zshrc.private ] && source ~/.zshrc.private

ZSH_SYNTAX_HIGHLIGHT=/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
if [ -f $ZSH_SYNTAX_HIGHLIGHT ]; then
	source $ZSH_SYNTAX_HIGHLIGHT
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -x "$(command -v starship)" ]; then
	eval "$(starship init zsh)"
fi
