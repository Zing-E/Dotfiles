#\____    / /   _____//   |   \ 
#  /     /  \_____  \/    ~    \
# /     /_  /        \    Y    /
#/_______ \/_______  /\___|_  / 
#        \/        \/       \/  

# Zings's zshrc

# Enables colors

autoload -U colors && colors

# Autocomplete settings

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# PS1

PS1="%B%{$fg[green]%}[%{$fg[green]%}%n%{$fg[green]%}@%{$fg[green]%}%M %{$fg[green]%}%~%{$fg[green]%}]$%b "

# Make grep have color

alias grep='grep --color=auto'

# switch ls to eza (it just looks better)

alias ls='eza'
alias la='eza -a'
alias ll='eza -l'

# Correct me if ls is spelled wrong

alias sl='ls --color=always'

# Alias's

alias nmtui='sudo nmtui'
alias cat='bat'
alias vimrc='vim /home/$USER/.vimrc' # If MacOS use /Users/$USER/.vimrc

# For Linux only

alias batper='cat /sys/class/power_supply/BAT1/capacity'

# Add a extra nonroot path for this user

export PATH=/Users/$USER/.local/bin:$PATH

# Plugins

source /usr/share/zsh/plugins/zsh-colored-man-pages/zsh-colored-man-pages.zsh 

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# For MacOS

#source /opt/homebrew/share/zsh-colored-man-pages/zsh-colored-man-pages.zsh # I did this myself manually

#source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
