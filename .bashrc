eval "$(/home/wabbajack/.local/bin/mise activate bash)"

if [ -f /etc/profile.d/bash_completion.sh ]; then
  source /etc/profile.d/bash_completion.sh
fi

alias ll='ls -la'
alias l='ls -la'
alias grep='rg'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ..='cd ..'
alias ...='cd ../..'

export EDITOR="zed --wait"
export VISUAL="zed --wait"
export BROWSER_USE_WAYLAND=1
export PLAYWRIGHT_CHROMIUM_USE_WAYLAND=1

eval "$(starship init bash)"
eval "$(zoxide init --cmd cd bash)"

# TODO: Load env variables somehow ?

# Hishtory Config:
# TODO: Remove this once available through mise
export PATH="$PATH:/home/wabbajack/.hishtory"

if [ -f /home/wabbajack/.hishtory/config.sh ]; then
  source /home/wabbajack/.hishtory/config.sh
fi
