[ -d $HOME/.yarn/bin ] && set PATH $HOME/.yarn/bin $PATH

[ -x $(which corepack) ] && alias yarn="corepack yarn"
