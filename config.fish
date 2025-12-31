if status is-interactive
    # Commands to run in interactive sessions can go here
end

if contains jorgebucaran/nvm.fish (fisher list 2>/dev/null) && test -f $HOME/.nvmrc
  nvm use
end
