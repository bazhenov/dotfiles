# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx brew colored-man common-aliases docker autojump)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export JAVA_TOOL_OPTIONS="-Dfile.encoding=utf8"
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export PS1='%{$reset_color%}%{${fg[green]}%}%3~ $(git_prompt_info)%{${fg_bold[$CARETCOLOR]}%}»%{${reset_color}%} '
export CDIFF_OPTIONS="-s -w 0"

export LESS="$LESS -i"

export PATH=$JAVA_HOME/bin:$HOME/bin:/usr/local/bin:$PATH:/usr/local/sbin

export EDITOR=vim

alias utf='iconv -f windows-1251 -t utf8'
alias notify='terminal-notifier -message "Your command is done sir" -title zsh -sound Glass'

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

sr=~/work/search-service

alias docker-host="screen /Users/bazhenov/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/tty"
source ~/.zshrc.private
