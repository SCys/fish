if status is-interactive
  # Commands to run in interactive sessions can go here

  set __check_location (curl -s -m 2 https://cloudflare.com/cdn-cgi/trace|grep loc=|cut -d'=' -f2)
  if test $__check_location = "CN"
    set -U in_cn true
    echo "cloudflare location return cn, use china mirrors"
  end 
end

if contains jorgebucaran/nvm.fish (fisher list 2>/dev/null) && test -f $HOME/.nvmrc
  nvm use
end
