type -q grok && alias grok="grok --permission-mode bypassPermissions"

# tmux/SSH often strip COLORTERM; Grok needs this to unlock truecolor themes.
set -gx COLORTERM truecolor

