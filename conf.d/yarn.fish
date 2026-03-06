[ -d $HOME/.yarn/bin ] && set PATH $HOME/.yarn/bin $PATH

type -q corepack && alias yarn="corepack yarn"
