PATH="$PATH:$HOME/.local/bin:$HOME/go/bin:$HOME/bin:/usr/local/bin"
EDITOR=nvim
FCEDIT=nvim
MINIKUBE_IN_STYLE=false
GOOGLE_APPLICATION_CREDENTIALS="$HOME/.config/gcloud/application_default_credentials.json"
USE_GKE_GCLOUD_AUTH_PLUGIN=True
XDG_CURRENT_DESKTOP="${XDG_CURRENT_DESKTOP:-sway}"
. "$HOME/.aliases"

# history
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# autocomplete based on prefix and history
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# binding for prefix based hisory in vim mode
function zvm_after_lazy_keybindings {
  bindkey -M vicmd 'j' down-line-or-beginning-search
  bindkey -M vicmd 'k' up-line-or-beginning-search
}

if [ -f ${HOME}/.env ]; then
    export $(cat ${HOME}/.env | grep -Ev "(^#.*|^$)" | xargs)
fi

# gcloud path update 
if [ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]; then
    . "${HOME}/google-cloud-sdk/path.zsh.inc"
fi

# gcloud autocomplete
if [ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]; then
    . "${HOME}/google-cloud-sdk/completion.zsh.inc"
fi

# https://github.com/hashicorp/terraform/issues/2182
function terraform-targets {
  sed 's/\x1b\[[0-9;]*m//g' | grep -o '# [^( ]* ' | sed " s/^# /-target '/; s/ $/'/; "
}

function use_plugin {
    . "/usr/share/zsh/plugins/zsh-${1}/zsh-${1}.plugin.zsh"
}

# make this a systemd service
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 8h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi

if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" > /dev/null
fi

# set black color background after 6pm
which swaymsg > /dev/null && ps -aux \
  | grep -q sway && [[ $(date +%H) -ge 17 || $(date +%H) -le 7 ]] \
    && swaymsg "output * bg #000000 solid_color"

# prompt
eval $(starship init zsh)

# plugins
use_plugin vi-mode
use_plugin autosuggestions
use_plugin syntax-highlighting
unfunction use_plugin
