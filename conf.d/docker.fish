if command -sq docker-compose
    docker-compose --version
    alias dc docker-compose
else
    alias dc "docker compose"
end
