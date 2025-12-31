if test -f /data/ollama/bin/ollama
    set -x PATH /data/ollama/bin $PATH
    set -x LD_LIBRARY_PATH /data/ollama/lib $LD_LIBRARY_PATH
    set -x OLLAMA_MODELS /data/ollama/models
    set -x OLLAMA_HOST 0.0.0.0:5001
else if test -d /data/ollama
    alias ollama="docker compose -f /data/docker-compose.yml exec ollama ollama"
end
