#/bin/bash

# ping.sh
# Used in kubernetes to check health from olefy
# Usage:
# spec:
#   containers:
#     - name: olefy
#       ...
#       livenessProbe:
#         exec:
#           command:
#           - olefy_ping.sh

# Defaults

## Host retrieved from first arg, defaults to 127.0.0.1
HOST=${1:-127.0.0.1}
## Port retrieved from 2nd arg, defaults to $OLEFY_BINDPORT, falls back to 10050
OLEFY_BINDPORT=${2:-${OLEFY_BINDPORT:-10050}}

# Display Usage

if [ "x$1" == "x-h" ] || [ "$#" -gt 2 ]; then
    echo -e "\nUsage: ping.sh [host] [port]"
    echo -e "  host: olefy server to check (default to 127.0.0.1)"
    echo -e "  port: olefy server port (default to OLEFY_BINDPORT then 10050)"
    exit 1 # required to make check fail if used for real
fi

# Check if help called


# Main

res=$(echo -ne "PING\n\n" | nc -N $HOST $OLEFY_BINDPORT)
if [ "x$res" != "xPONG" ]; then
    exit 1
fi

