# Keep the outer Konsole terminal truthful; tmux advertises tmux-256color itself.
if set -q TMUX
    set -gx TERM tmux-256color
else
    set -gx TERM xterm-256color
end

