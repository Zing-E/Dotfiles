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
alias vimrc='vim /Users/$USER/.vimrc' # If other Unix OS use /home/$USER/.vimrc

# For MacOS only

alias batper='cat /sys/class/power_supply/BAT1/capacity'

# Add a extra nonroot path for this user

export PATH=/Users/$USER/.local/bin:$PATH

# Plugins

source /opt/homebrew/share/zsh-colored-man-pages/zsh-colored-man-pages.plugin.zsh 2>/dev/null

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
