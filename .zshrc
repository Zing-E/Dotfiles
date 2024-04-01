#\____    / /   _____//   |   \ 
#  /     /  \_____  \/    ~    \
# /     /_  /        \    Y    /
#/_______ \/_______  /\___|_  / 
#        \/        \/       \/  

# Zing's zshrc

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

# Enables vimode

#bindkey -v
#export KEYTIMEOUT=1

# Make grep have color

alias grep='grep --color=auto'

# switch ls to exa (it just looks better)

alias ls='eza'
alias la='eza -a'
alias ll='eza -l'

# Correct me if ls is spelled wrong

alias sl='ls --color=always'

# Alias's

alias nmtui='sudo nmtui'
alias cat='bat'
alias batper='cat /sys/class/power_supply/BAT1/capacity'

# OpenBSD audio output commands

#alias speaker-mute='doas mixerctl outputs.master.mute=on'
#alias speaker-unmute='doas mixerctl outputs.master.mute=off'

# Add a extra nonroot path for this user

export PATH=/home/$USER/.local/bin:$PATH

# Makes /usr/games A path for OpenBSD

#export PATH=/usr/games:$PATH

# Plugins

source /opt/homebrew/share/zsh-colored-man-pages/zsh-colored-man-pages.plugin.zsh

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
