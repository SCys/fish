alias gs 'git status -s'
alias gl 'git log --stat --max-count=10'
alias gd 'git diff'
alias gt "git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

function git-search
    git log -S"$argv" --pretty=format:%H | map git show
end
