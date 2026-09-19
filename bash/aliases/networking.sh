#===============================================================================
# Networking Aliases
# Author: srees
# Description: Network diagnostics and information tools
# Last Modified: 2026-02-16
#===============================================================================

#-------------------------------------------------------------------------------
# IP & Connectivity
#-------------------------------------------------------------------------------
alias myip="curl -4 ifconfig.me"       # Public IP
alias localip="ip a | grep inet"       # Local IP interfaces
alias ports="netstat -tulnp"           # Open ports
alias pingg="ping -c 5 google.com"     # Quick connectivity check

#-------------------------------------------------------------------------------
# Tools
#-------------------------------------------------------------------------------
alias wifi="nmcli dev wifi list"
alias speedtest="curl -s https://raw.githubusercontent.com/sreesreejuks/speedtest-cli/master/speedtest.py | python3 -"
