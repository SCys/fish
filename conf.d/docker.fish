if test -x $HOME/.local/bin/docker-compose
    alias dc docker-compose
else
    alias dc "docker compose"
end
