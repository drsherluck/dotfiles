# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:${HOME}/.local/bin:${HOME}/go/bin:${HOME}/bin"
export EDITOR=nvim
export FCEDIT=nvim
export MINIKUBE_IN_STYLE=false
export GOOGLE_APPLICATION_CREDENTIALS="${HOME}/.config/gcloud/application_default_credentials.json"
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export $(cat ${HOME}/.env | grep -Ev "(^#.*|^$)" | xargs)

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Plugins
plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]; then
    . "${HOME}/google-cloud-sdk/path.zsh.inc"
fi
# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]; then
    . "${HOME}/google-cloud-sdk/completion.zsh.inc"
fi

# https://github.com/hashicorp/terraform/issues/2182
terraform-targets () {
  sed 's/\x1b\[[0-9;]*m//g' \
    | grep -o '# [^( ]* ' \
    | sed " s/^# /-target '/; s/ $/'/; "
}

# Start ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 8h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" > /dev/null
fi

# set black color background after 6pm
ps -aux \
  | grep -q sway && [[ $(date +%H) -ge 17 || $(date +%H) -le 7 ]] \
  && swaymsg "output * bg #000000 solid_color"

eval $(starship init zsh)
