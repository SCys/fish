# ~/.config/fish/config.fish

# Function to check if we're in a VSCode code-server environment
function is_code_server
  # Check if the VSCODE_IPC_HOOK_CLI environment variable is set.
  # This is a reliable indicator of a code-server session.
  if set -q VSCODE_AGENT_FOLDER
    return 0  # True: It's a code-server session
  else
    return 1  # False: It's not a code-server session
  end
end

# Check if we are in a code-server environment or not
if is_code_server
#  # If it's a code-server session, don't set the proxy
#  echo "Detected VSCode code-server environment. Skipping HTTP_PROXY setting."
#else
  # If it's not a code-server session, set the proxy
  #set -gx HTTP_PROXY "http://service-hy.nodes.iscys.com:5002"
  #set -gx HTTPS_PROXY "http://service-hy.nodes.iscys.com:5002"

  # ping to check if the proxy server is reachable
  set -gx HTTP_PROXY "http://100.64.0.12:5002"
  set -gx HTTPS_PROXY "http://100.64.0.12:5002"
  #if you need to use socks5 proxy
  #set -gx HTTP_PROXY "socks5h://your_proxy_address:your_proxy_port"
  #set -gx HTTPS_PROXY "socks5h://your_proxy_address:your_proxy_port"
  echo "HTTP_PROXY and HTTPS_PROXY set."
end

# Optionally, set NO_PROXY if needed
# set -gx NO_PROXY "localhost,127.0.0.1,localaddress,.localdomain.com"

# Add any other fish configuration you need below this point.

