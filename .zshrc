ZSH=$HOME/.oh-my-zsh

ZSH_THEME="avit"
ZSH_COMPDUMP=$HOME/.zcompdump
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"

plugins=(git osx brew colored-man common-aliases docker autojump)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export PATH=$HOME/bin:$PATH

# Configuring Java
jhome="/usr/libexec/java_home"
if [[ -x $jhome ]] then
	export JAVA_HOME=`$jhome -v 1.8`
	export JAVA_TOOL_OPTIONS="-Dfile.encoding=utf8"
	export PATH=$PATH:$JAVA_HOME/bin
fi

PROMPT='%{$reset_color%}%{${fg[green]}%}%3~ %{${fg_bold[$CARETCOLOR]}%}»%{${reset_color}%} '
RPROMPT=""

export CDIFF_OPTIONS="-s -w 0"
export LESS="$LESS -i"

export EDITOR=nvim

alias utf='iconv -f windows-1251 -t utf8'
alias notify='terminal-notifier -message "Your command is done sir" -title zsh -sound Glass'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias dc='docker-compose'

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

docker-export aglio bazhenov/aglio
docker-export avr-gcc bazhenov/avr-toolchain
docker-export avr-objcopy bazhenov/avr-toolchain

alias docker-host="screen ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/tty"
source ~/.zshrc.private
